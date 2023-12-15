public ActionForward getStaffClassList(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("Starting");
		try {
			UserLoggingsPojo userLoggingDetails = (UserLoggingsPojo) request.getSession(false).getAttribute("token_information");
			
			String classTeacherId=request.getParameter("staffid");
			String locationId=request.getParameter("locationid");
			String accyearId=request.getParameter("accyearid");
			
			StaffDetailsVo vo=new StaffDetailsBD().getStaffClassList(classTeacherId,locationId,accyearId,userLoggingDetails);
			
			ObjectMapper objmap = new ObjectMapper();
			String jsonStr = objmap.writeValueAsString(vo);
			
			JSONObject object = new JSONObject();
			object.put("list", jsonStr);
			response.getWriter().print(object);
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
		logger.info("Ending");
		
		return null;
	}
	
	public ActionForward getStaffClassListByLocationAndYear(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("Starting getStaffClassListByLocationAndYear method");
		try {
			UserLoggingsPojo userLoggingDetails = (UserLoggingsPojo) request.getSession().getAttribute("token_information");
			
			String classTeacherId = request.getParameter("staffid");
			String locationId = request.getParameter("locationid");
			String accyearId = request.getParameter("accyearid");
			
			StaffDetailsVo vo = new StaffDetailsBD().getStaffClassList(classTeacherId, locationId, accyearId, userLoggingDetails);
			
			ObjectMapper objmap = new ObjectMapper();
			String jsonStr = objmap.writeValueAsString(vo);
			
			JSONObject object = new JSONObject();
			object.put("list", jsonStr);
			response.getWriter().print(object);
			
		} catch (Exception e) {
			logger.error("Error in getStaffClassListByLocationAndYear method: " + e.getMessage(), e);
			throw new Exception("An error occurred while retrieving staff class list. Please try again later.");
		} finally {
			logger.info("Ending getStaffClassListByLocationAndYear method");
		}
		
		return null;
	}


public ActionForward getStaffClassListByLocationAndYearWithCache(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("Starting getStaffClassListByLocationAndYearWithCache method");
		try {
			UserLoggingsPojo userLoggingDetails = (UserLoggingsPojo) request.getSession().getAttribute("token_information");
			
			String classTeacherId = request.getParameter("staffid");
			String locationId = request.getParameter("locationid");
			String accyearId = request.getParameter("accyearid");
			
			// Check if the data is already in cache
			Element element = cache.get(classTeacherId + locationId + accyearId);
			if (element != null) {
				String jsonStr = (String) element.getObjectValue();
				JSONObject object = new JSONObject();
				object.put("list", jsonStr);
				response.getWriter().print(object);
				return null;
			}
			
			// If not, retrieve the data and put it in cache
			StaffDetailsVo vo = new StaffDetailsBD().getStaffClassList(classTeacherId, locationId, accyearId, userLoggingDetails);
			
			ObjectMapper objmap = new ObjectMapper();
			String jsonStr = objmap.writeValueAsString(vo);
			
			JSONObject object = new JSONObject();
			object.put("list", jsonStr);
			response.getWriter().print(object);
			
			Element newElement = new Element(classTeacherId + locationId + accyearId, jsonStr);
			cache.put(newElement);
			
		} catch (Exception e) {
			logger.error("Error in getStaffClassListByLocationAndYearWithCache method: " + e.getMessage(), e);
			throw new Exception("An error occurred while retrieving staff class list. Please try again later.");
		} finally {
			logger.info("Ending getStaffClassListByLocationAndYearWithCache method");
		}
		
		return null;
		
		public interface CachingConstants {

			public static final Map<String, List<StudentDetailsVo>> allStudentCache = new HashMap<>();
		}

		
		/*if(CachingConstants.allStudentCache.get("allStudentList") == null) {
				System.err.println("IF LOOP ");
				JSONObject object = new JSONObject();
				object.put("list", list);
				CachingConstants.allStudentCache.put("allStudentList", list);
				response.getWriter().print(object);
			}else {
				System.err.println("ELSE LOOP ");
				JSONObject object = new JSONObject();
				object.put("list", CachingConstants.allStudentCache.get("allStudentList"));
				response.getWriter().print(object);
			}*/
	}
