package com.minicrm

import java.io.Serializable;

import org.apache.commons.lang.builder.HashCodeBuilder

class OpportunityActivity implements Serializable {

	private static final long serialVersionUID = 1
	
	Opportunity opportunity
	Activity activity
	
	boolean equals(other) {
		if (!(other instanceof OpportunityActivity)) {
			return false
		}

		other.opportunity?.id == opportunity?.id &&
		other.activity?.id == activity?.id
	}
	
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (opportunity) builder.append(opportunity.id)
		if (activity) builder.append(activity.id)
		builder.toHashCode()
	}
	
	static OpportunityActivity get(long opportunityId, long activityId) {
		OpportunityActivity.where {
			opportunity == Opportunity.load(opportunityId) &&
			activity == Activity.load(activityId)
		}.get()
	}
	
	static boolean exists(long opportunityId, long activityId) {
		OpportunityActivity.where {
			opportunity == Opportunity.load(opportunityId) &&
			activity == Activity.load(activityId)
		}.count() > 0
	}
	
	static OpportunityActivity create(Opportunity opportunity, Activity activity, boolean flush = false) {
		def instance = new OpportunityActivity(opportunity: opportunity, activity: activity)
		instance.save(flush: flush, insert: true)
		instance
	}
	
	static boolean remove(Opportunity o, Activity a, boolean flush = false) {
		if (o == null || a == null) return false

		int rowCount = OpportunityActivity.where {
			opportunity == Opportunity.load(o.id) &&
			activity == Activity.load(a.id)
		}.deleteAll()

		if (flush) { OpportunityActivity.withSession { it.flush() } }

		rowCount > 0
	}
	
	static void removeAll(Opportunity o, boolean flush = false) {
		if (o == null) return

		OpportunityActivity.where {
			opportunity == Opportunity.load(o.id)
		}.deleteAll()

		if (flush) { OpportunityActivity.withSession { it.flush() } }
	}

	static void removeAll(Activity a, boolean flush = false) {
		if (a == null) return

		OpportunityActivity.where {
			activity == Activity.load(a.id)
		}.deleteAll()

		if (flush) { OpportunityActivity.withSession { it.flush() } }
	}
	
    static constraints = {
		activity validator: { Activity a, OpportunityActivity oa ->
			if (oa.opportunity == null) return
			boolean existing = false
			OpportunityActivity.withNewSession {
				existing = OpportunityActivity.exists(oa.opportunity.id, a.id)
			}
			if (existing) {
				return 'opportunityActivity.exists'
			}
		}
		opportunity nullable:false
    }
	
	static mapping = {
		id composite: ['opportunity', 'activity']
		version false
	}
}
