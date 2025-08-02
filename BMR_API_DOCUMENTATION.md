# BMR Connect API Documentation

## Base URLs


### Development (Flutter)
```
http://your-dev-server.com/api/
```

## API Endpoints

### Authentication & Employee Management

#### Login
```bash
curl -X POST "{{base_url}}/index.php/employee/loginapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "username={{username}}&password={{password}}&version_no={{version_no}}"
```

#### Logout
```bash
curl -X POST "{{base_url}}/index.php/employee/logout" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "emp_id={{emp_id}}"
```


#### Reset Employee Session
```bash
curl -X POST "{{base_url}}/index.php/employee/resetemployeeloginapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "emp_id={{emp_id}}&username={{username}}&password={{password}}"
```

#### Change Password
```bash
curl -X POST "{{base_url}}/index.php/employee/changepasswordapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "emp_id={{emp_id}}&password={{password}}"
```

#### Employee Attendance - Check In
```bash
curl -X POST "{{base_url}}/index.php/employee/createattendance" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "empid={{emp_id}}&check_in={{check_in}}&geo_checkin={{geo_checkin}}&starting_meter={{starting_meter}}"
```

#### Employee Attendance - Check Out
```bash
curl -X POST "{{base_url}}/index.php/employee/updateattendance" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "empid={{emp_id}}&update_id={{update_id}}&check_out={{check_out}}&geo_checkout={{geo_checkout}}&closing_meter={{closing_meter}}"
```

#### Day-In Status Verification
```bash
curl -X GET "{{base_url}}/index.php/employee/dayinverification?emp_id={{emp_id}}"
```

#### Employee GPS Log
```bash
curl -X POST "{{base_url}}/index.php/employee/employeegpslog" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "emp_id={{emp_id}}&timestamp={{timestamp}}&device_id={{device_id}}&gps_coordinates={{gps_coordinates}}&battery_level={{battery_level}}"
```

#### Get Employee List
```bash
curl -X POST "{{base_url}}/index.php/employee/getlistapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "login_id={{login_id}}"
```

#### Get Department List
```bash
curl -X GET "{{base_url}}/index.php/employee/getdepartmentlistapi"
```

#### Get Region List
```bash
curl -X POST "{{base_url}}/index.php/employee/getregionlist" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "login_id={{login_id}}"
```

#### Get Region-based Employee List
```bash
curl -X POST "{{base_url}}/index.php/employee/getregionemployeelist" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "region_id={{region_id}}&login_id={{login_id}}"
```

#### Get Employee Live Route
```bash
curl -X POST "{{base_url}}/index.php/employee/getliveroute" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "emp_id={{emp_id}}&date={{date}}"
```

#### Get Employee Route History
```bash
curl -X POST "{{base_url}}/index.php/employee/getemployeelivelog" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "emp_id={{emp_id}}&date={{date}}"
```

#### Get Employee Session List
```bash
curl -X POST "{{base_url}}/index.php/employee/employeeloginlistapi"
```


#### Send Customer Email
```bash
curl -X POST "{{base_url}}/index.php/employee/sendcustomermail" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "guest_email={{guest_email}}&emp_name={{emp_name}}&task_id={{customer_name}}&comments={{comments}}"
```

### Task Management

#### Create Task Summary
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/createtasksummaryapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "task_id={{task_id}}&task_date={{task_date}}&created_by_id={{created_by_id}}&approved_by={{approved_by_id}}&assigned_by_id={{assigned_by_id}}&created_date={{created_date}}&taskSchedule={{taskSchedule}}"
```

#### Update Task Summary
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/updatetasksummaryapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "task_id={{task_id}}&td_id={{td_id}}&task_date={{task_date}}&created_by_id={{created_by_id}}&approved_by={{approved_by_id}}&created_date={{created_date}}&taskSchedule={{task}}"
```

#### Get Task List
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/getlisttaskapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "emp_id={{emp_id}}&region_id={{region_id}}&from_date={{from_date}}&to_date={{to_date}}"
```

#### Get Pending Task Approval List
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/getlistallpendingtaskapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "emp_id={{emp_id}}&region_id={{region_id}}&from_date={{from_date}}&to_date={{to_date}}"
```

#### Get Current Day Task List
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/getcurrentlisttaskapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "emp_id={{emp_id}}&region_id={{region_id}}&from_date={{from_date}}&to_date={{to_date}}"
```

#### Get Pending Task List
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/getlistpendingtaskapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "emp_id={{employee_id}}"
```

#### Task Check-In
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/tasksummarycheckinapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "td_id={{td_id}}&check_in={{check_in}}&geo_checkin={{geo_checkin}}&login_id={{emp_id}}"
```

#### Task Check-Out
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/tasksummarycheckoutapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "td_id={{td_id}}&check_out={{check_out}}&geo_checkout={{geo_checkout}}&login_id={{emp_id}}"
```

#### Update Task Status (Approval)
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/updatetaskstatusapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "user_id={{user_id}}&taskid={{task_id}}&approvedstatus={{approved_status}}"
```

#### Get Schedule List
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/getinchargebyclusterdataapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "login_id={{login_id}}"
```

### TODO List Management

#### Get TODO Tasks List
```bash
curl -X GET "{{base_url}}/index.php/taskSummary/gettodolistapi"
```

#### Get Task by ID
```bash
curl -X POST "{{base_url}}/index.php/taskSummary/gettaskdataapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "task_id={{task_id}}"
```

#### Create TODO Task
```bash
curl -X POST "{{base_url}}/index.php/taskSummary/createtodotaskapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "task_text={{task_text}}&task_due={{task_due}}&task_notes={{task_notes}}&created_by={{created_by}}"
```

#### Update TODO Task
```bash
curl -X POST "{{base_url}}/index.php/taskSummary/updatetodotaskapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "task_id={{task_id}}&task_text={{task_text}}&task_due={{task_due}}&task_notes={{task_notes}}"
```

#### Delete Task
```bash
curl -X POST "{{base_url}}/index.php/taskSummary/deletetaskapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "task_id={{task_id}}"
```

#### Get My TODO List
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/getmytodolist" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "emp_id={{emp_id}}&assignee_type={{assignee_type}}&priority={{priority}}&status={{status}}"
```

#### Get Tasks Assigned by Me
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/gettodolistcreatedbyme" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "emp_id={{emp_id}}&assignee_type={{assignee_type}}&priority={{priority}}&status={{status}}"
```

#### Update My TODO Task
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/updatemytodotaskapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "task_id={{task_id}}&status={{status}}&priority={{priority}}&task_notes={{task_notes}}&login_id={{login_id}}"
```

#### Update Assigned Task
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/updatetodotaskapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "task_id={{task_id}}&task_name={{task_name}}&status={{status}}&priority={{priority}}&task_due={{task_due}}&task_notes={{task_notes}}&assigned_to={{assigned_to}}&assigned_type={{assigned_type}}&login_id={{login_id}}"
```

#### Create TODO List with Assignment
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/createtodotaskapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "task_text={{task_text}}&status={{status}}&priority={{priority}}&created_by={{created_by}}&task_due={{task_due}}&task_notes={{task_notes}}&assigned_to={{assigned_to}}&assigned_type={{assigned_type}}"
```

### Customer Management

#### Get Customer List
```bash
curl -X POST "{{base_url}}/index.php/customers/getlistapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "login_id={{emp_id}}"
```

#### Create Customer
```bash
curl -X POST "{{base_url}}/index.php/customers/customercreateapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "contact_no={{contact_no}}&customercategory={{category}}&firstname={{firstname}}&lastname={{lastname}}&address1={{address1}}&address2={{address2}}&city={{city}}&state={{state}}&zone={{zone}}&comments={{comments}}&cust_type={{cust_type}}&customerof={{customerof}}&status={{status}}"
```

#### Update Customer
```bash
curl -X POST "{{base_url}}/index.php/customers/customerupdateapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "custid={{custid}}&contact_no={{contact_no}}&customercategory={{category}}&firstname={{firstname}}&lastname={{lastname}}&address1={{address1}}&address2={{address2}}&city={{city}}&state={{state}}&zone={{zone}}&comments={{comments}}&cust_type={{cust_type}}&customerof={{customerof}}&status={{status}}"
```

#### Check Customer Details
```bash
curl -X POST "{{base_url}}/index.php/customers/customercheckapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "emp_id={{emp_id}}&mobile={{mobile}}"
```

#### Get State/City List
```bash
curl -X GET "{{base_url}}/index.php/customers/getstatecity"
```

#### Get Dealers List
```bash
curl -X GET "{{base_url}}/index.php/customers/getdealers?region_id={{region_id}}"
```

### Pond Management

#### Create Pond
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/createpondapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "emp_id={{emp_id}}&cust_id={{cust_id}}&pond_id={{pond_id}}&comments={{comments}}&size={{size}}&density={{density}}&pond_refer={{pond_ref}}&status={{status}}&wsa={{wsa}}&salinity={{salinity}}&seed_stocking={{seed_stocking}}&ph={{ph}}&stocking_date={{stocking_date}}&recorded_date={{recorded_date}}"
```

#### Update Pond
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/updatepondapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "emp_id={{emp_id}}&cust_id={{cust_id}}&pondid={{pond_id}}&cycle_id={{cycle_id}}&pond_id={{cust_pond_id}}&comments={{comments}}&size={{size}}&density={{density}}&pond_refer={{pond_ref}}&status={{status}}&wsa={{wsa}}&seed_stocking={{seed_stocking}}&ph={{ph}}&salinity={{salinity}}&stocking_date={{stocking_date}}&recorded_date={{recorded_date}}"
```

#### Get Pond List
```bash
curl -X GET "{{base_url}}/index.php/tasksummary/getpondlist?cust_id={{customer_id}}"
```

#### Get Pond Details
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/getponddata" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "cycle_id={{cycle_id}}&pondid={{pond_id}}"
```

#### Get Pond Sampling List
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/getPondlistSampling" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "cust_id={{customer_id}}"
```

### Sampling Management

#### Create Sampling
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/createsampling" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "cycle_id={{cycle_id}}&emp_id={{emp_id}}&daily_feed={{daily_feed}}&recorded_date={{recorded_date}}&sample_harvest_flag={{sample_harvest_flag}}&abw={{abw}}&sampling_date={{sampling_date}}"
```

#### Update Sampling
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/updatesampling" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "sample_id={{sample_id}}&emp_id={{emp_id}}&daily_feed={{daily_feed}}&recorded_date={{recorded_date}}&sample_harvest_flag={{sample_harvest_flag}}&abw={{abw}}"
```

#### Check Active Cycle
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/checkactivecycleapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "pond_id={{pond_id}}&cust_id={{cust_id}}"
```

#### Get Sample History
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/getSampleHistory" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "cust_id={{cust_id}}&cycle_id={{cycle_id}}&pond_id={{pond_id}}&request={{request}}"
```

#### Create New Sampling Cycle (Multipart)
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/createsampling" \
-H "Content-Type: multipart/form-data" \
-F "task_id={{task_id}}" \
-F "pond_id={{pond_id}}" \
-F "cust_id={{cust_id}}" \
-F "cycle_id={{cycle_id}}" \
-F "emp_id={{emp_id}}" \
-F "new_cycle={{new_cycle}}" \
-F "culture_seed_date={{culture_seed_date}}" \
-F "doc={{doc}}" \
-F "stocking_date={{stocking_date}}" \
-F "seed_stocking={{seed_stocking}}" \
-F "ph={{ph}}" \
-F "abw={{abw}}" \
-F "salinity={{salinity}}" \
-F "sampling_date={{sampling_date}}" \
-F "daily_feed={{daily_feed}}" \
-F "adg={{adg}}" \
-F "sampling_file=@{{file_path}}"
```

### Harvest Management

#### Create Harvest (Multipart)
```bash
curl -X POST "{{base_url}}/index.php/tasksummary/createharvest" \
-H "Content-Type: multipart/form-data" \
-F "task_id={{task_id}}" \
-F "cycle_id={{cycle_id}}" \
-F "emp_id={{emp_id}}" \
-F "pond_id={{pond_id}}" \
-F "cust_id={{cust_id}}" \
-F "harvest_date={{harvest_date}}" \
-F "sample_harvest_flag={{sample_harvest_flag}}" \
-F "daily_feed={{daily_feed}}" \
-F "abw={{abw}}" \
-F "survival={{survival}}" \
-F "ph={{ph}}" \
-F "salinity={{salinity}}" \
-F "e_biomass={{e_biomass}}" \
-F "a_biomass={{a_biomass}}" \
-F "density={{density}}" \
-F "adg={{adg}}" \
-F "fcr={{fcr}}" \
-F "productivity={{productivity}}" \
-F "qty={{qty}}" \
-F "seed_source={{seed_source}}" \
-F "doc={{doc}}" \
-F "acres={{acres}}" \
-F "total_feed={{total_feed}}" \
-F "sampling_file=@{{file_path}}"
```

### Feedback Management

#### Get Feedback Questions
```bash
curl -X GET "{{base_url}}/index.php/feedbackquestion/getlist?type={{type}}"
```

#### Submit Feedback
```bash
curl -X POST "{{base_url}}/index.php/feedbackQuestion/feedbackquestionsubmitapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "td_id={{td_id}}&fb_submit_time={{fb_submit_time}}&fb_geo_json={{fb_geo_json}}&feedBack={{feedback}}&login_id={{emp_id}}&fb_comments={{comments}}"
```

#### Physical Test
```bash
curl -X POST "{{base_url}}/index.php/feedbackquestion/qcphysicaltestapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "task_id={{task_id}}&login_id={{login_id}}&datetime={{datetime}}&powder_hg_1_2={{powder_hg_1_2}}&hg3s_3p_4s_4_5={{hg3s_3p_4s_4_5}}&pride3p_4s_4={{pride3p_4s_4}}&fcr={{fcr}}&molds_infection={{molds_infection}}&fibrous={{fibrous}}&stichingproblem={{stichingproblem}}&feedsinkingtime={{feedsinkingtime}}&farmer_id={{farmer_id}}&pond_id={{pond_id}}&comments={{comments}}"
```

#### Technical Test
```bash
curl -X POST "{{base_url}}/index.php/feedbackquestion/qcphysicaltestapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "task_id={{task_id}}&login_id={{login_id}}&datetime={{datetime}}&farmer_id={{farmer_id}}&pond_id={{pond_id}}&water_sources={{water_sources}}&pumping={{pumping}}&treatment={{treatment}}&check_tray_feed_qty={{check_tray_feed_qty}}&sedimentation_tank={{sedimentation_tank}}&pre_treatment_available={{pre_treatment_available}}&fencing_and_disinfectants={{fencing_and_disinfectants}}&applied_any_fermentation={{applied_any_fermentation}}&probiotic_supplementation={{probiotic_supplementation}}&aerators_chlorination_after_crap={{aerators_chlorination_after_crap}}&comments={{comments}}"
```

### Management Request

#### Get Management Requests List
```bash
curl -X GET "{{base_url}}/index.php/managementrequest/getlist/{{id}}"
```

#### Create Management Request
```bash
curl -X POST "{{base_url}}/index.php/managementRequest/createRequest" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "req_by={{emp_id}}&req_dep={{dept_id}}&req_desc={{req_desc}}&comments={{comments}}&req_qty={{req_qty}}&expected_budget={{expect_budget}}"
```

#### Update Management Request
```bash
curl -X POST "{{base_url}}/index.php/managementRequest/updateRequest" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "id={{c_id}}&req_by={{emp_id}}&req_dep={{dept_id}}&req_desc={{req_desc}}&comments={{comments}}&req_qty={{req_qty}}&expected_budget={{expect_budget}}"
```

#### Delete Management Request
```bash
curl -X POST "{{base_url}}/index.php/managementRequest/deleteRequest" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "req_id={{request_id}}"
```

#### Get Employee Department Info
```bash
curl -X GET "{{base_url}}/index.php/managementRequest/getemployeedepartment/{{id}}"
```

### Leave Management

#### Get Leave Balance
```bash
curl -X POST "{{base_url}}/index.php/leaverequest/getbalanceleaveapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "emp_id={{emp_id}}"
```

#### Create Leave Request
```bash
curl -X POST "{{base_url}}/index.php/leaverequest/createleaverequestapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "emp_id={{emp_id}}&leave_type={{leave_type}}&purpose={{purpose}}&leave_days={{leave_days}}&from_date={{from_date}}&to_date={{to_date}}"
```

#### Get Leave Approval List
```bash
curl -X POST "{{base_url}}/index.php/leaverequest/leavelistapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "emp_id={{emp_id}}"
```

#### Approve/Reject Leave Request
```bash
curl -X POST "{{base_url}}/index.php/leaverequest/approvalleaverequestapi" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "emp_id={{emp_id}}&leave_id={{leave_id}}&status={{status}}"
```

### Other APIs

#### Get Zone List
```bash
curl -X GET "{{base_url}}/index.php/regionalzonemaster/getlistapi"
```

## Flutter App Endpoints

The Flutter app uses simplified endpoint names that are appended to the base URL:

- `login`
- `logout`
- `employee/list`
- `task/list`
- `todo/list`
- `leave/request`
- `attendance`
- `change-password`

## Configuration

### Android App
- Default timeout: 5 minutes


## Authentication
- Tokens are stored in SharedPreferences
- Authorization headers are automatically added to all requests

## HTTP Clients
- **Android**: Retrofit 2.6.0 with OkHttp3, RxJava2 adapters, and Gson converter
- **Flutter**: Dio HTTP client with interceptors

## Notes
1. Replace `{{base_url}}` with the actual API base URL
2. Replace all `{{variable}}` placeholders with actual values
3. For multipart requests, replace `@{{file_path}}` with the actual file path
4. All endpoints follow a consistent PHP backend structure under `index.php`
5. Some endpoints have both regular and geo_json variants (for location-based operations)
6. The API supports both FormUrlEncoded and Multipart request types