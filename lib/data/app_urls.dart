class AppUrls {
  static const baseUrl = "https://www.devbmr.webperfection.in/";
  static const login = "index.php/employee/loginapi";
  static const logout = "index.php/employee/logout";
  static const changepasswordapi = "index.php/employee/changepasswordapi";
  static const createAttendance = "index.php/employee/createattendance";
  static const updateAttendance = "index.php/employee/updateattendance";
  static const dayInStatusVerification = "index.php/employee/dayinverification";
  static const employeeGpsLog = "index.php/employee/employeegpslog";
  static const getlistapi = "index.php/employee/getlistapi";
  static const getdepartmentlistapi = "index.php/employee/getdepartmentlistapi";
  static const getregionlist = "index.php/employee/getregionlist";
  static const getregionemployeelist =
      "index.php/employee/getregionemployeelist";
  static const getliveroute = "index.php/employee/getliveroute";
  static const getemployeelivelog = "index.php/employee/getemployeelivelog";
  static const employeeloginlistapi = "index.php/employee/employeeloginlistapi";
  static const resetemployeeloginapi =
      "index.php/employee/resetemployeeloginapi";
  static const sendcustomermail = "index.php/employee/sendcustomermail";

  // Task
  static const createtasksummaryapi =
      "index.php/tasksummary/createtasksummaryapi";
  static const updatetasksummaryapi =
      "index.php/tasksummary/updatetasksummaryapi";
  static const getTaskList = "index.php/tasksummary/getlisttaskapi";
  static const getPendingTaskApprovalList =
      "index.php/tasksummary/getlistallpendingtaskapi";
  static const getCurrentDayTaskList =
      "index.php/tasksummary/getcurrentlisttaskapi";
  static const getPendingTaskList =
      "index.php/tasksummary/getlistpendingtaskapi";
  static const taskCheckIn = "index.php/tasksummary/tasksummarycheckinapi";
  static const taskCheckOut = "index.php/tasksummary/tasksummarycheckoutapi";
  static const updateTaskStatus = "index.php/tasksummary/updatetaskstatusapi";
  static const getScheduleList =
      "index.php/tasksummary/getinchargebyclusterdataapi";
  static const getTaskById = "index.php/taskSummary/gettaskdataapi";
  static const getTasksAssignedByMe =
      "index.php/tasksummary/gettodolistcreatedbyme";
  static const updateAssignedTask = "index.php/tasksummary/updatetodotaskapi";

// To do
  static const getTodoTasksList = "index.php/taskSummary/gettodolistapi";
  static const createTodoTask = "index.php/taskSummary/createtodotaskapi";
  static const updateTodoTask = "index.php/taskSummary/updatetodotaskapi";
  static const deleteTask = "index.php/taskSummary/deletetaskapi";
  static const getMyTodoList = "index.php/tasksummary/getmytodolist";
  static const updateMyTodoTask = "index.php/tasksummary/updatemytodotaskapi";
  static const createTodoTaskWithAssignment =
      "index.php/tasksummary/createtodotaskapi";

// Customer
  static const getCustomerList = "index.php/customers/getlistapi";
  static const createCustomer = "index.php/customers/customercreateapi";
  static const updateCustomer = "index.php/customers/customerupdateapi";
  static const checkCustomerDetails = "index.php/customers/customercheckapi";

  // custom
  static const getStateCityList = "index.php/customers/getstatecity";
  static const getDealersList = "index.php/customers/getdealers";

  // Pond
  static const createPond = "index.php/tasksummary/createpondapi";
  static const updatePond = "index.php/tasksummary/updatepondapi";
  static const getPondList = "index.php/tasksummary/getpondlist";
  static const getPondDetails = "index.php/tasksummary/getponddata";
  static const getPondSamplingList =
      "index.php/tasksummary/getPondlistSampling";

  // Sampling
  static const createSampling = "index.php/tasksummary/createsampling";
  static const updateSampling = "index.php/tasksummary/updatesampling";
  static const checkActiveCycle = "index.php/tasksummary/checkactivecycleapi";
  static const getSampleHistory = "index.php/tasksummary/getSampleHistory";

  // harvest
  static const createHarvest = "index.php/tasksummary/createharvest";

  // feedback
  static const getFeedbackQuestions = "index.php/feedbackquestion/getlist";
  static const submitFeedback =
      "index.php/feedbackQuestion/feedbackquestionsubmitapi";
  static const physicalTest = "index.php/feedbackquestion/qcphysicaltestapi";
  static const technicalTest =
      "index.php/feedbackquestion/qcphysicaltestapi"; // same endpoint as physicalTest

// management
  static const getManagementRequests = "index.php/managementrequest/getlist";
  static const createManagementRequest =
      "index.php/managementRequest/createRequest";
  static const updateManagementRequest =
      "index.php/managementRequest/updateRequest";
  static const deleteManagementRequest =
      "index.php/managementRequest/deleteRequest";
  static const getEmployeeDepartment =
      "index.php/managementRequest/getemployeedepartment";

  // leave
  static const getLeaveBalance = "index.php/leaverequest/getbalanceleaveapi";
  static const createLeaveRequest =
      "index.php/leaverequest/createleaverequestapi";
  static const getLeaveApprovalList = "index.php/leaverequest/leavelistapi";
  static const approveRejectLeaveRequest =
      "index.php/leaverequest/approvalleaverequestapi";

  static const getZoneList = "index.php/regionalzonemaster/getlistapi";
}

// employee/getdepartmentlistapi
// feedbackquestion/getlist
// feedbackQuestion/feedbackquestionsubmitapi
/// tasksummary/tasksummarycheckoutapi
///taskSummary/gettodolistapi
///taskSummary/gettaskdataapi
///taskSummary/createtodotaskapi
///taskSummary/updatetodotaskapi
///taskSummary/deletetaskapi
///managementrequest/getlist
///managementRequest/createRequest
///managementRequest/updateRequest
///managementRequest/deleteRequest
///managementRequest/getemployeedepartment
///employee/sendcustomermail
///customers/customerupdateapi
///tasksummary/createpondapi
///tasksummary/updatepondapi
///tasksummary/getpondlist
///tasksummary/updatesampling
///tasksummary/updatemytodotaskapi
///employee/getdepartmentlistapi
///employee/logout
///employee/employeeloginlistapi
///leaverequest/getbalanceleaveapi
///leaverequest/approvalleaverequestapi
