package com.minicrm

import grails.transaction.Transactional
import java.awt.Color
import org.jfree.chart.ChartFactory
import org.jfree.chart.ChartRenderingInfo
import org.jfree.chart.labels.ItemLabelPosition
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator
import org.jfree.chart.renderer.category.BarRenderer
import org.jfree.chart.entity.StandardEntityCollection
import org.jfree.chart.plot.PlotOrientation
import org.jfree.chart.labels.ItemLabelAnchor
import org.jfree.ui.TextAnchor
import org.jfree.data.category.DefaultCategoryDataset
import org.jfree.chart.ChartUtilities

@Transactional
class ReportService {

    def sessionFactory
	def grailsApplication
    
    def findCustomerDist() {
        final session = sessionFactory.currentSession
        final String query = "select b.name province_name, c.name city_name, \
                                count(a.id) customer_num from customer a, province b, city c \
                                where a.city_id = c.id \
                                        and c.province_id = b.id \
                                group by a.city_id \
                                order by customer_num desc"

        final queryResults = session.createSQLQuery(query).with { list() }

        return queryResults.collect { resultRow ->
            [provinceName: resultRow[0], cityName: resultRow[1], customerNum: resultRow[2]]
        }
    }

    def drawCustomerDistChart(resultData, chartTitle, xTitle, yTitle) {
        if(resultData==null) return ""

        def dataset = new DefaultCategoryDataset();
        resultData.each { result ->
            dataset.addValue(result.customerNum.toDouble().value, result.provinceName, result.cityName)
        }

        def chart = ChartFactory.createBarChart(chartTitle,
                                                  yTitle,
                                                  xTitle,
                                                  dataset,
                                                  PlotOrientation.HORIZONTAL,
                                                  false,
                                                  false,
                                                  false);

        def plot = chart.getCategoryPlot(); 
        plot.setBackgroundPaint(Color.white);
        plot.setDomainGridlinePaint(Color.pink);
        plot.setRangeGridlinePaint(Color.pink);

        def renderer = new BarRenderer();
        renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
		renderer.setBasePositiveItemLabelPosition(new ItemLabelPosition(ItemLabelAnchor.OUTSIDE3, 
																	TextAnchor.BASELINE_RIGHT));
        renderer.setBaseItemLabelsVisible(true);
        renderer.setItemLabelAnchorOffset(20D);
        plot.setRenderer(renderer);

        final def info = new ChartRenderingInfo(new StandardEntityCollection());
        def chartImgFile = ReportUtils.getDrawFileName("customerDistChart")
		saveChartAsFile(chartImgFile, chart, info)
        return chartImgFile
    }
	
	def saveChartAsFile(imgFileName, chart, info) {
		def chartImgDir = grailsApplication.parentContext.getResource(ConstUtils.CHART_IMAGES_DIR).file
		if(!chartImgDir.exists()) {
			chartImgDir.mkdir()
		}
		def chartImgFile = new File(chartImgDir.toString() + "/" + imgFileName)
		ChartUtilities.saveChartAsPNG(chartImgFile, chart, 600, 300, info);
		return chartImgFile.toString()
	}
}
