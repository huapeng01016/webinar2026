*! 1.0.0  18/may/2026

program define waypoint
	version 16

	args fasttravel 
	
	local talks "C:/talks/"
	local webinar "C:/talks/webinar2026/"
	
	if "`fasttravel'" == "" {
		// set all waypoints
		global waypoint_talks "`talks'"
		global waypoint_webinar "`webinar'"
	}
	else if "`fasttravel'" == "list" {
		display "waypoint:"
		display "waypoint_talks: |$waypoint_talks|" 
		display "waypoint_webinar: |$waypoint_webinar|" 
	}
	else if inlist("`fasttravel'", "talks", "webinar") {
		global waypoint_`fasttravel' "``fasttravel''"		
		cd "${waypoint_`fasttravel'}"
	}
	else {
di in red "Unknow argument `fasttravel'"
error 198`	
	}
	exit
end

