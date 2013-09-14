-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 26, 2013 at 08:25 AM
-- Server version: 5.5.25
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gibbon`
--

-- --------------------------------------------------------

--
-- Table structure for table `gibbonAction`
--

CREATE TABLE `gibbonAction` (
  `gibbonActionID` int(7) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonModuleID` int(4) unsigned zerofill NOT NULL,
  `name` varchar(50) NOT NULL COMMENT 'The action name should be unqiue to the module that it is related to',
  `precedence` int(2) NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `URLList` text NOT NULL COMMENT 'Comma seperated list of all URLs that make up this action',
  `entryURL` varchar(255) NOT NULL,
  `entrySidebar` enum('Y','N') NOT NULL DEFAULT 'Y',
  `defaultPermissionAdmin` enum('N','Y') NOT NULL DEFAULT 'N',
  `defaultPermissionTeacher` enum('N','Y') NOT NULL DEFAULT 'N',
  `defaultPermissionStudent` enum('N','Y') NOT NULL DEFAULT 'N',
  `defaultPermissionParent` enum('N','Y') NOT NULL DEFAULT 'N',
  `defaultPermissionSupport` enum('N','Y') NOT NULL DEFAULT 'N',
  `categoryPermissionStaff` enum('Y','N') NOT NULL DEFAULT 'Y',
  `categoryPermissionStudent` enum('Y','N') NOT NULL DEFAULT 'Y',
  `categoryPermissionParent` enum('Y','N') NOT NULL DEFAULT 'Y',
  `categoryPermissionOther` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`gibbonActionID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=795 ;

--
-- Dumping data for table `gibbonAction`
--

INSERT INTO `gibbonAction` (`gibbonActionID`, `gibbonModuleID`, `name`, `precedence`, `category`, `description`, `URLList`, `entryURL`, `entrySidebar`, `defaultPermissionAdmin`, `defaultPermissionTeacher`, `defaultPermissionStudent`, `defaultPermissionParent`, `defaultPermissionSupport`, `categoryPermissionStaff`, `categoryPermissionStudent`, `categoryPermissionParent`, `categoryPermissionOther`) VALUES
(0000059, 0015, 'Payment', 0, 'Reports', 'Print payment list', 'report_payment.php', 'report_payment.php', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y'),
(0000011, 0005, 'Emergency SMS by Year Group', 0, 'Reports', 'Output all parental first mobile numbers by year group: if there are no details, then show emergency details.', 'report_emergencySMS_byYearGroup.php', 'report_emergencySMS_byYearGroup.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
(0000058, 0015, 'Attendance by Activity', 0, 'Reports', 'Print attendance lists', 'report_attendance.php, report_attendance_print.php', 'report_attendance.php', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y'),
(0000056, 0015, 'My Activities', 0, 'Actions', 'Allows a user to view the activities they are involved in', 'activities_my.php, activities_my_full.php', 'activities_my.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
(0000057, 0015, 'Participants by Activity', 0, 'Reports', 'Print participant lists', 'report_participants.php, report_participants_print.php', 'report_participants.php', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y'),
(0000055, 0015, 'Manage Activities', 0, 'Actions', 'Allows managers to build activity program', 'activities_manage.php, activities_manage_add.php, activities_manage_edit.php, activities_manage_delete.php,activities_manage_enrolment.php,activities_manage_enrolment_add.php,activities_manage_enrolment_edit.php,activities_manage_enrolment_delete.php', 'activities_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000054, 0001, 'Manage Activity Settings', 0, 'Teaching & Learning', 'Control activity settings', 'activitySettings.php', 'activitySettings.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000053, 0015, 'View Activities_studentRegister', 1, 'Actions', 'Allows students to view activities and register', 'activities_view.php, activities_view_full.php, activities_view_register.php', 'activities_view.php', 'Y', 'N', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N'),
(0000052, 0015, 'View Activities_view', 0, 'Actions', 'Allows users to view activities', 'activities_view.php, activities_view_full.php', 'activities_view.php', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(0000051, 0014, 'View Timetable by Person', 0, 'View Timetables', 'Allows users to view timetables', 'tt.php, tt_view.php', 'tt.php', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(0000050, 0013, 'Tie Days To Dates', 0, 'Timetable', 'Allows admins to place timetable days into the school calendar', 'ttDates.php, ttDates_edit.php, ttDates_edit_add.php, ttDates_edit_delete.php', 'ttDates.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000049, 0013, 'Manage Columns', 0, 'Timetable', 'Allow admins to manage timetable columns', 'ttColumn.php, ttColumn_add.php, ttColumn_edit.php, ttColumn_delete.php, ttColumn_edit_row_add.php, ttColumn_edit_row_edit.php, ttColumn_edit_row_delete.php', 'ttColumn.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000048, 0013, 'Manage Timetables', 0, 'Timetable', 'Allow admins to create and manage timetables', 'tt.php, tt_add.php, tt_edit.php, tt_delete.php, tt_import.php, tt_edit_day_add.php, tt_edit_day_edit.php, tt_edit_day_delete.php, tt_edit_day_edit_class.php, tt_edit_day_edit_class_delete.php, tt_edit_day_edit_class_add.php, tt_edit_day_edit_class_edit.php, tt_edit_day_edit_class_exception.php, tt_edit_day_edit_class_exception_add.php, tt_edit_day_edit_class_exception_delete.php', 'tt.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000014, 0008, 'Update Personal Data_family', 0, '', 'Allows users to update personal information for themselves and their family members', 'data_personal.php', 'data_personal.php', 'Y', 'N', 'N', 'N', 'Y', 'N', 'Y', 'Y', 'Y', 'Y'),
(0000047, 0012, 'Assess', 0, '', 'Allows users to assess each other''s work', 'crowdAssess.php,crowdAssess_view.php,crowdAssess_view_discuss.php, crowdAssess_view_discuss_post.php', 'crowdAssess.php', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(0000046, 0011, 'Individual Needs Records_viewEdit', 2, '', 'Allows users to edit IN records for all students ', 'in_view.php, in_edit.php', 'in_view.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000045, 0011, 'Individual Needs Records_view', 0, '', 'Allows user to view IN records for all students', 'in_view.php, in_edit.php', 'in_view.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000044, 0006, 'Students Not Onsite', 0, 'Reports', 'Print a report of students who are not physically on the school campus on a given day', 'report_studentsNotOnsite_byDate.php,report_studentsNotOnsite_byDate_print.php', 'report_studentsNotOnsite_byDate.php', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y'),
(0000043, 0005, 'Students by Roll Group', 0, 'Reports', 'Print student roll group lists', 'report_students_byRollGroup.php, report_students_byRollGroup_print.php', 'report_students_byRollGroup.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
(0000042, 0005, 'View Student Profile_myChildren', 1, 'Profiles', 'Allows parents to view their student''s information', 'student_view.php, student_view_details.php', 'student_view.php', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N'),
(0000041, 0007, 'Markbook_viewMyChildrensClasses', 1, '', 'Allows parents to view their children''s classes', 'markbook_view.php', 'markbook_view.php', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N'),
(0000040, 0009, 'Lesson Planner_viewMyChildrensClasses', 0, 'Planning', 'Allows parents to view their children''s classes', 'planner.php, planner_view_full.php, planner_deadlines.php, planner_view_full_post.php', 'planner.php', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N'),
(0000063, 0002, 'Personal Data Updates ', 0, 'Data Updater', 'Allows admins to process data update requests for personal data', 'data_personal.php, data_personal_edit.php, data_personal_delete.php', 'data_personal.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000039, 0007, 'View Markbook_myMarks', 2, '', 'View your own marks', 'markbook_view.php', 'markbook_view.php', 'Y', 'N', 'N', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
(0000036, 0009, 'Lesson Planner_viewAllEditMyClasses', 2, 'Planning', 'View all planner information and edit all planner information for classes user is in', 'planner.php, planner_view_full.php, planner_add.php, planner_edit.php, planner_delete.php, planner_deadlines.php, planner_duplicate.php, planner_view_full_post.php, planner_view_full_submit_edit.php, planner_bump.php', 'planner.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
(0000035, 0009, 'Lesson Planner_viewMyClasses', 1, 'Planning', 'View all planner information for classes user is in', 'planner.php, planner_view_full.php, planner_deadlines.php, planner_view_full_post.php', 'planner.php', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
(0000022, 0004, 'View Departments', 0, '', 'Allows uers to view all department details.', 'departments.php, department.php, department_course.php, department_course_class.php, department_course_class_full.php, department_course_unit_add.php, department_course_unit_edit.php, department_course_unit_delete.php, department_course_unit_duplicate.php, department_edit.php, department_course_edit.php', 'departments.php', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(0000065, 0002, 'Medical Form Updates ', 0, 'Data Updater', 'Allows admins to process data update requests for medical data', 'data_medical.php, data_medical_edit.php, data_medical_delete.php', 'data_medical.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000064, 0008, 'Update Medical Form_family', 0, '', 'Allows users to update medical information for themselves and their family members', 'data_medical.php', 'data_medical.php', 'Y', 'N', 'N', 'N', 'Y', 'N', 'Y', 'Y', 'Y', 'Y'),
(0000034, 0007, 'Edit Markbook_singleClass', 0, '', 'Edit columns and grades for a single class at a time.', 'markbook_edit.php, markbook_edit_add.php, markbook_edit_edit.php, markbook_edit_delete.php,markbook_edit_data.php', 'markbook_edit.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
(0000033, 0007, 'View Markbook_allClassesAllData', 3, '', 'View all markbook information for all users', 'markbook_view.php, markbook_view_full.php', 'markbook_view.php', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y'),
(0000032, 0002, 'Manage Staff', 0, 'User Management', 'Edit staff within the system', 'staff_manage.php, staff_manage_add.php, staff_manage_edit.php, staff_manage_delete.php', 'staff_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000025, 0001, 'Manage Spaces', 0, 'Other', 'Allows users to create a list of spaces and rooms in the school', 'space_manage.php, space_manage_add.php, space_manage_edit.php, space_manage_delete.php', 'space_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000027, 0006, 'Attendance By Roll', 0, 'Take Attendance', 'Take attendance, one roll group at a time', 'attendance_take_byRollGroup.php', 'attendance_take_byRollGroup.php', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y'),
(0000026, 0006, 'Attendance By Person', 0, 'Take Attendance', 'Take attendance, one person at a time', 'attendance_take_byPerson.php', 'attendance_take_byPerson.php', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y'),
(0000028, 0006, 'Set Future Absence', 0, 'Future Information', 'Set future absences one student at a time', 'attendance_future_byPerson.php', 'attendance_future_byPerson.php', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y'),
(0000029, 0006, 'Students Not Present', 0, 'Reports', 'Print a report of students who are not present on a given day', 'report_studentsNotPresent_byDate.php,report_studentsNotPresent_byDate_print.php', 'report_studentsNotPresent_byDate.php', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y'),
(0000030, 0006, 'Roll Groups Not Registered', 0, 'Reports', 'Print a report of roll groups who have not been registered on a given day', 'report_rollGroupsNotRegistered_byDate.php,report_rollGroupsNotRegistered_byDate_print.php', 'report_rollGroupsNotRegistered_byDate.php', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y'),
(0000024, 0005, 'View Student Profile_full', 2, 'Profiles', 'View full profile of any student in the school.', 'student_view.php,student_view_details.php,student_view_details_notes_add.php,student_view_details_notes_edit.php,student_view_details_notes_delete.php', 'student_view.php', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'N'),
(0000031, 0006, 'Student History_all', 1, 'Reports', 'Print a report of all attendance data in the current school year for a student', 'report_studentHistory.php,report_studentHistory_print.php', 'report_studentHistory.php', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y', 'Y'),
(0000023, 0005, 'View Student Profile_brief', 1, 'Profiles', 'View brief profile of any student in the school.', 'student_view.php,student_view_details.php', 'student_view.php', 'Y', 'N', 'N', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
(0000021, 0002, 'Manage Medical Forms', 0, 'Medical', 'Manage medical form information for users ', 'medicalForm_manage.php,medicalForm_manage_add.php,medicalForm_manage_edit.php,medicalForm_manage_delete.php,medicalForm_manage_condition_add.php,medicalForm_manage_condition_edit.php,medicalForm_manage_condition_delete.php', 'medicalForm_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000020, 0003, 'Manage Themes', 0, '', '', 'theme_manage.php,theme_manage_install.php,theme_manage_edit.php,theme_manage_uninstall.php', 'theme_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000019, 0002, 'Manage Families', 0, 'User Management', '', 'family_manage.php,family_manage_add.php,family_manage_edit.php,family_manage_delete.php,family_manage_edit_editChild.php,family_manage_edit_deleteChild.php,family_manage_edit_editAdult.php,family_manage_edit_deleteAdult.php', 'family_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000018, 0013, 'Course Enrolment by Class', 0, 'Courses & Classes', '', 'courseEnrolment_manage.php,courseEnrolment_manage_class_edit.php,courseEnrolment_manage_class_edit_edit.php,courseEnrolment_manage_class_edit_delete.php', 'courseEnrolment_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000017, 0013, 'Manage Courses & Classes', 0, 'Courses & Classes', '', 'course_manage.php,course_manage_add.php,course_manage_edit.php,course_manage_delete.php,course_manage_class_add.php,course_manage_class_edit.phpcourse_manage_class_delete.php', 'course_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000016, 0001, 'Manage Special Days', 0, 'Years, Days & Times', '', 'schoolYearSpecialDay_manage.php,schoolYearSpecialDay_manage_add.php,schoolYearSpecialDay_manage_edit.php,schoolYearSpecialDay_manage_delete.php', 'schoolYearSpecialDay_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000015, 0001, 'Manage Terms', 0, 'Years, Days & Times', '', 'schoolYearTerm_manage.php,schoolYearTerm_manage_add.php,schoolYearTerm_manage_edit.php,schoolYearTerm_manage_delete.php', 'schoolYearTerm_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000013, 0001, 'Manage Days of the Week', 0, 'Years, Days & Times', '', 'daysOfWeek_manage.php', 'daysOfWeek_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000010, 0003, 'Manage Modules', 0, '', '', 'module_manage.php,module_manage_install.php,module_manage_edit.php,module_manage_uninstall.php,module_manage_update.php', 'module_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000012, 0002, 'Manage Permissions', 0, 'User Management', '', 'permission_manage.php,permission_manage_edit.php', 'permission_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000009, 0002, 'Manage Roles', 0, 'User Management', '', 'role_manage.php,role_manage_add.php,role_manage_edit.php,role_manage_delete.php', 'role_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000008, 0001, 'Manage Houses', 0, 'Groupings', '', 'house_manage.php,house_manage_edit.php,house_manage_add.php,house_manage_delete.php', 'house_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000007, 0001, 'Manage Roll Groups', 0, 'Groupings', '', 'rollGroup_manage.php,rollGroup_manage_edit.php,rollGroup_manage_add.php,rollGroup_manage_delete.php', 'rollGroup_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000005, 0003, 'System Settings', 0, '', 'Main system settings', 'systemSettings.php', 'systemSettings.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000006, 0001, 'Manage Year Groups', 0, 'Groupings', '', 'yearGroup_manage.php,yearGroup_manage_edit.php,yearGroup_manage_add.php,yearGroup_manage_delete.php', 'yearGroup_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000004, 0002, 'Student Enrolment', 0, 'Enrolment', 'Allows user to control student enrolment in the current year', 'studentEnrolment_manage.php,studentEnrolment_manage_add.php,studentEnrolment_manage_edit.php,studentEnrolment_manage_delete.php', 'studentEnrolment_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000003, 0001, 'Manage School Years', 0, 'Years, Days & Times', 'Allows user to control the definition of academic years within the system', 'schoolYear_manage.php,schoolYear_manage_edit.php,schoolYear_manage_delete.php,schoolYear_manage_add.php', 'schoolYear_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000002, 0002, 'Manage Users', 0, 'User Management', 'Edit any user within the system', 'user_manage.php, user_manage_add.php, user_manage_edit.php, user_manage_delete.php, user_manage_password.php', 'user_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000060, 0006, 'Student History_myChildren', 0, 'Reports', 'Print a report of all attendance data in the current school yearfor my children', 'report_studentHistory.php', 'report_studentHistory.php', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N'),
(0000061, 0009, 'Work Summary by Roll Group', 0, 'Reports', 'Print work summary statistical data by roll group', 'report_workSummary_byRollGroup.php', 'report_workSummary_byRollGroup.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
(0000062, 0001, 'Manage Departments', 0, 'Groupings', 'Allows admins to create learning areas and administrative groups.', 'department_manage.php,department_manage_add.php,department_manage_edit.php,department_manage_delete.php', 'department_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000038, 0009, 'Lesson Planner_viewEditAllClasses', 3, 'Planning', 'View and edit all planner information for all classes', 'planner.php, planner_view_full.php, planner_add.php, planner_edit.php, planner_delete.php, planner_deadlines.php, planner_duplicate.php, planner_view_full_post.php, planner_view_full_submit_edit.php, planner_bump.php', 'planner.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000066, 0013, 'Class Enrolment by Roll Group', 0, 'Reports', 'Shows the number of classes students are enroled in, organised by roll group', 'report_classEnrolment_byRollGroup.php', 'report_classEnrolment_byRollGroup.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
(0000067, 0015, 'Activity Type by Roll Group', 0, 'Reports', 'Print roll group lists showing count of various activity types', 'report_activityType_rollGroup.php', 'report_activityType_rollGroup.php', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'N'),
(0000068, 0016, 'External Assessment Data_view', 0, '', 'Allow users to view assessment data for all students', 'externalAssessment.php, externalAssessment_details.php', 'externalAssessment.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000069, 0016, 'External Assessment Data_manage', 1, '', 'Allows users to manage external assessment data', 'externalAssessment.php, externalAssessment_details.php, externalAssessment_manage_details_add.php, externalAssessment_manage_details_edit.php, externalAssessment_manage_details_delete.php', 'externalAssessment_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000070, 0002, 'Rollover', 0, 'Admissions', 'Allows admins to kick the school forward one year', 'rollover.php', 'rollover.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000071, 0009, 'Staff Gold Stars', 0, 'Reports', 'Shows the number of gold stars for each member of staff', 'report_goldStars_staff.php', 'report_goldStars_staff.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
(0000072, 0005, 'Student Transport', 0, 'Reports', 'Shows student transport details', 'report_transport_student.php', 'report_transport_student.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000073, 0005, 'Student Data Updater History', 0, 'Reports', 'Allows users to check, for a group of students, how recently they have been updated', 'report_student_dataUpdaterHistory.php', 'report_student_dataUpdaterHistory.php', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'N'),
(0000075, 0005, 'Medical Data Summary', 0, 'Reports', 'Allows users to show a summary of medical data for a group of students.', 'report_student_medicalSummary.php, report_student_medicalSummary_print.php', 'report_student_medicalSummary.php', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'N'),
(0000077, 0005, 'Emergency Data Summary', 0, 'Reports', 'Allows users to show a summary of emergency contact data for a group of students.', 'report_student_emergencySummary.php, report_student_emergencySummary_print.php', 'report_student_emergencySummary.php', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y', 'N', 'N', 'N'),
(0000074, 0017, 'Apply', 0, '', 'Allows users, with or without an account, to apply for student place.', 'applicationForm.php', 'applicationForm.php', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(0000001, 0002, 'Application Form Settings', 0, 'Admissions', 'Allows admins to control the application form', 'applicationFormSettings.php', 'applicationFormSettings.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000078, 0002, 'Manage Applications', 0, 'Admissions', 'Allows admins to view and action applications', 'applicationForm_manage.php, applicationForm_manage_edit.php, applicationForm_manage_delete.php, applicationForm_manage_accept.php, applicationForm_manage_reject.php', 'applicationForm_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000585, 0008, 'Update Personal Data_any', 1, '', 'Create personal data update request for any user', 'data_personal.php', 'data_personal.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000586, 0008, 'Update Medical Data_any', 1, '', 'Create medical data update request for any user', 'data_medical.php', 'data_medical.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000789, 0007, 'Edit Markbook_multipleClassesAcrossSchool', 2, '', 'Edit columns and grades for a single class belonging to the user, or multiple classes across the whole school.', 'markbook_edit.php, markbook_edit_add.php,markbook_edit_addMulti.php, markbook_edit_edit.php, markbook_edit_delete.php,markbook_edit_data.php', 'markbook_edit.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000788, 0007, 'Edit Markbook_multipleClassesInDepartment', 1, '', 'Edit columns and grades for a single class belonging to the user, or multiple classes within departments.', 'markbook_edit.php, markbook_edit_add.php,markbook_edit_addMulti.php, markbook_edit_edit.php, markbook_edit_delete.php,markbook_edit_data.php', 'markbook_edit.php', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000787, 0005, 'Student ID Cards ', 1, 'Reports', 'A report for bulk creation of student ID cards.', 'report_students_IDCards.php', 'report_students_IDCards.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000756, 0005, 'Left Students', 1, 'Reports', 'A report showing all the students who have left within a specified date range.', 'report_students_left.php', 'report_students_left.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000747, 0132, 'Catalog Summary', 0, 'Reports', 'Provides an summary overview of items in the catalog.', 'report_catalogSummary.php', 'report_catalogSummary.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000746, 0001, 'Manage SMS Settings', 0, 'Other', 'Manage gateway settings for outgoing SMS messages.', 'smsSettings.php', 'smsSettings.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000744, 0121, 'New Message_bySMS', 0, '', 'Send messages by SMS.', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000745, 0121, 'View Message Wall', 0, '', 'Allows users to view all messages posted on their message wall.', 'messageWall_view.php,messageWall_view_full.php', 'messageWall_view.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000743, 0121, 'New Message_byMessageWall', 0, '', 'Send messages by message wall.', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000742, 0121, 'New Message_byEmail', 0, '', 'Send messages by email.', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000605, 0001, 'Manage Behaviour Settings', 0, 'People', 'Manage settings for the Behaviour module', 'behaviourSettings.php', 'behaviourSettings.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000606, 0119, 'Manage Behaviour Records_all', 1, '', 'Manage all behaviour records', 'behaviour_manage.php, behaviour_manage_add.php, behaviour_manage_edit.php, behaviour_manage_delete.php', 'behaviour_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000607, 0119, 'Manage Behaviour Records_my', 0, '', 'Manage behaviour records create by the user', 'behaviour_manage.php, behaviour_manage_add.php, behaviour_manage_edit.php, behaviour_manage_delete.php', 'behaviour_manage.php', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000608, 0119, 'View Behaviour Records', 0, '', 'View behaviour records by student', 'behaviour_view.php,behaviour_view_details.php', 'behaviour_view.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
(0000609, 0005, 'Emergency SMS by Transport', 0, 'Reports', 'Show SMS emergency details by transport route', 'report_emergencySMS_byTransport.php', 'report_emergencySMS_byTransport.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000610, 0001, 'Manage Resource Settings', 0, 'Teaching & Learning', 'Manage settings for the resources module', 'resourceSettings.php', 'resourceSettings.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000611, 0120, 'Manage Resources_all', 1, '', 'Manage all resources', 'resources_manage.php, resources_manage_add.php, resources_manage_edit.php, resources_manage_delete.php', 'resources_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000612, 0120, 'Manage Resources_my', 0, '', 'Manage resources created by the user', 'resources_manage.php, resources_manage_add.php, resources_manage_edit.php, resources_manage_delete.php', 'resources_manage.php', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000613, 0120, 'View Resources', 0, '', 'View resources', 'resources_view.php,resources_view_details.php,resources_view_full.php', 'resources_view.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y'),
(0000614, 0121, 'New Message_classes_my', 1, '', 'Bulk email to any of my classes', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000615, 0121, 'New Message_classes_any', 9, '', 'Bulk email to any class', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000616, 0121, 'New Message_classes_parents', 5, '', 'Include parents in messages posted to classes', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000617, 0121, 'New Message_courses_my', 3, '', 'Bulk email to any of my courses', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000618, 0121, 'New Message_courses_any', 11, '', 'Bulk email to any courses', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000619, 0121, 'New Message_courses_parents', 7, '', 'Include parents in messages posted to courses', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000620, 0121, 'New Message_rollGroups_my', 2, '', 'Bulk email to any of my roll groups', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000621, 0121, 'New Message_rollGroups_any', 10, '', 'Bulk email to any roll group', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000622, 0121, 'New Message_rollGroups_parents', 6, '', 'Include parents in messages posted to parents', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000623, 0121, 'New Message_activities_my', 0, '', 'Bulk email to any of my activities', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000624, 0121, 'New Message_activities_any', 8, '', 'Bulk email to any activity', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000625, 0121, 'New Message_activities_parents', 4, '', 'Include parents in messages posted to activities', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000626, 0121, 'New Message_yearGroups_any', 8, '', 'Bulk email to any year group', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000627, 0121, 'New Message_yearGroups_parents', 4, '', 'Include parents in messages posted to year group', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000628, 0121, 'New Message_role', 8, '', 'Bulk email to a particular role', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000629, 0121, 'Manage Messages_my', 0, '', 'Edit all messages created by the user', 'messenger_manage.php,messenger_manage_delete.php,messenger_manage_edit.php', 'messenger_manage.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000630, 0121, 'Manage Messages_all', 1, '', 'Edit all messages', 'messenger_manage.php,messenger_manage_delete.php,messenger_manage_edit.php', 'messenger_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'Y', 'N'),
(0000631, 0003, 'Update', 0, '', 'Update Gibbon to a new version', 'update.php', 'update.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000632, 0121, 'New Message_fromSchool', 0, '', 'Bulk email from the school''s email address', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000662, 0009, 'Manage Units_learningAreas', 0, 'Planning', 'Manage all units within the learning areas I have appropriate permission', 'units.php, units_add.php, units_delete.php, units_edit.php, units_duplicate.php, units_edit_deploy.php, units_edit_working.php, units_edit_working_copyback.php, units_edit_working_add.php, units_edit_copyBack.php, units_edit_copyForward.php, units_dump.php', 'units.php', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000660, 0121, 'New Message_houses_all', 15, '', 'Bulk email to members of all houses', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000661, 0009, 'Manage Units_all', 0, 'Planning', 'Manage all units within the school', 'units.php, units_add.php, units_delete.php, units_edit.php, units_duplicate.php, units_edit_deploy.php, units_edit_working.php, units_edit_working_copyback.php, units_edit_working_add.php, units_edit_copyBack.php, units_edit_copyForward.php, units_dump.php', 'units.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000657, 0121, 'New Message_applicants', 12, '', 'Bulk email to applicants by intended school year of entry', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'Y', 'N'),
(0000658, 0121, 'New Message_individuals', 13, '', 'Bulk email to indvidual users', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000659, 0121, 'New Message_houses_my', 14, '', 'Bulk email to members of my house', 'messenger_post.php', 'messenger_post.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000655, 0014, 'View Timetable by Space', 0, 'View Timetables', 'View space usage according to the timetable', 'tt_space.php,tt_space_view.php', 'tt_space.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000656, 0013, 'Course Enrolment by Person', 0, 'Courses & Classes', 'Manage course enrolment for a single user', 'courseEnrolment_manage_byPerson.php, courseEnrolment_manage_byPerson_edit.php, courseEnrolment_manage_byPerson_edit_edit.php, courseEnrolment_manage_byPerson_edit_delete.php', 'courseEnrolment_manage_byPerson.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000673, 0015, 'Activity Spread by Roll Group', 0, 'Reports', 'View spread of enrolment over terms and days by roll group', 'report_activitySpread_rollGroup.php', 'report_activitySpread_rollGroup.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000674, 0001, 'Manage Planner Settings', 0, 'Teaching & Learning', 'Edit settings for the planner', 'plannerSettings.php', 'plannerSettings.php', 'Y', 'Y', 'N', 'N', 'N', '', 'Y', 'N', 'N', 'N'),
(0000675, 0009, 'Manage Outcomes_viewAllEditLearningArea', 1, 'Planning', 'View all outcomes in the school, edit any from Learning Areas where you are Coordinator or Teacher (Curriculum)', 'outcomes.php, outcomes_add.php, outcomes_edit.php, outcomes_delete.php', 'outcomes.php', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000676, 0009, 'Manage Outcomes_viewEditAll', 2, 'Planning', 'Manage all outcomes in the school', 'outcomes.php, outcomes_add.php, outcomes_edit.php, outcomes_delete.php', 'outcomes.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000677, 0009, 'Manage Outcomes_viewAll', 0, 'Planning', 'View all outcomes in the school', 'outcomes.php', 'outcomes.php', 'Y', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000678, 0126, 'Manage Rubrics_viewAllEditLearningArea', 0, '', 'View all rubrics in the school, edit any from Learning Areas where you are Coordinator or Teacher (Curriculum)', 'rubrics.php, rubrics_add.php, rubrics_edit.php, rubrics_delete.php, rubrics_edit_editRowsColumns.php', 'rubrics.php', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000679, 0126, 'Manage Rubrics_viewEditAll', 1, '', 'Manage all rubrics in the school', 'rubrics.php, rubrics_add.php, rubrics_edit.php, rubrics_delete.php, rubrics_edit_editRowsColumns.php', 'rubrics.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000705, 0015, 'Activity Choices by Student', 1, 'Reports', 'View all student activity choices in the current year for a given student', 'report_activityChoices_byStudent.php', 'report_activityChoices_byStudent.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000706, 0001, 'Manage Grade Scales', 1, 'ARR', 'Manage all aspects of grade scales, which are used throughout ARR to control grade input.', 'gradeScales_manage.php, gradeScales_manage_add.php, gradeScales_manage_edit.php, gradeScales_manage_delete.php, gradeScales_manage_edit_grade_add.php, gradeScales_manage_edit_grade_edit.php, gradeScales_manage_edit_grade_delete.php', 'gradeScales_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000707, 0005, 'New Students', 1, 'Reports', 'A report showing all new students in the current school year.', 'report_students_new.php', 'report_students_new.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000708, 0126, 'View Rubrics', 0, '', 'View all rubrics in the school, except students who can only view those for own year group.', 'rubrics_view.php, rubrics_view_full.php', 'rubrics_view.php', 'Y', 'N', 'N', 'Y', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000717, 0132, 'Manage Catalog', 0, 'Catalog', 'Control all items in the school library catalog', 'library_manage_catalog.php, library_manage_catalog_add.php, library_manage_catalog_edit.php, library_manage_catalog_delete.php, library_manage_catalog_duplicate.php', 'library_manage_catalog.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000718, 0015, 'Activity Enrollment Summary', 0, 'Reports', 'View summary enrollment information for all activities in the current year.', 'report_activityEnrollmentSummary.php', 'report_activityEnrollmentSummary.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000719, 0132, 'Lending & Activity Log', 0, 'Catalog', 'Manage lending, returns, reservations, repairs, decommissioning, etc.', 'library_lending.php, library_lending_item.php,library_lending_item_signout.php,library_lending_item_return.php,library_lending_item_edit.php,library_lending_item_renew.php', 'library_lending.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000720, 0001, 'Manage Library Settings', 0, 'Teaching & Learning', 'Manage settings for the Library module', 'librarySettings.php', 'librarySettings.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000721, 0005, 'Age & Gender Summary', 0, 'Reports', 'Summarises gender, age and school year', 'report_students_ageGenderSummary.php', 'report_students_ageGenderSummary.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000722, 0005, 'Roll Group Summary', 0, 'Reports', 'Summarises gender and number of students across all roll groups.', 'report_rollGroupSummary.php', 'report_rollGroupSummary.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000723, 0001, 'Manage Alert Levels', 0, 'People', 'Manage the alert levels which are used throughout the school to flag problems.', 'alertLevelSettings.php', 'alertLevelSettings.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000724, 0011, 'Individual Needs Records_viewContribute', 1, '', 'Allows users to contribute teaching strategies to IN records for all students ', 'in_view.php, in_edit.php', 'in_view.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000726, 0001, 'Manage IN Descriptors', 0, 'People', 'Allows admins to control the descriptors available for use in the Individual Needs module.', 'inDescriptors_manage.php, inDescriptors_manage_add.php, inDescriptors_manage_edit.php, inDescriptors_manage_delete.php', 'inDescriptors_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000727, 0011, 'Individual Needs Summary', 0, '', 'Allows user to see a flexible summary of IN data.', 'in_summary.php', 'in_summary.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000729, 0119, 'Find Behaviour Patterns', 0, '', 'Allows user to spot students who are repeat or regular offenders.', 'behaviour_pattern.php', 'behaviour_pattern.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000730, 0132, 'Browse The Library', 0, 'Catalog', 'Search and view all borrowable items maintained by the library', 'library_browse.php', 'library_browse.php', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(0000731, 0132, 'View Overdue Items', 0, 'Reports', 'View items which are on loan and have exceeded their due date.', 'report_viewOverdueItems.php', 'report_viewOverdueItems.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N'),
(0000732, 0132, 'Student Borrowing Record', 0, 'Reports', 'View items borrowed by an individual student.', 'report_studentBorrowingRecord.php', 'report_studentBorrowingRecord.php', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000733, 0002, 'Manage User Settings', 0, 'User Management', 'Configure settings relating to user management.', 'userSettings.php', 'userSettings.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000734, 0005, 'Family Address by Student', 0, 'Reports', 'View family addresses by student', 'report_familyAddress_byStudent.php', 'report_familyAddress_byStudent.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000735, 0002, 'Data Updater Settings', 0, 'Data Updater', 'Configure options for the Data Updater module', 'dataUpdaterSettings.php', 'dataUpdaterSettings.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000736, 0001, 'External Assessment Settings', 0, 'ARR', 'Configure External Assessment module options', 'externalAssessmentSettings.php', 'externalAssessmentSettings.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000737, 0001, 'Markbook Settings', 0, 'ARR', 'Configure options for the Markbook module', 'markbookSettings.php', 'markbookSettings.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000738, 0015, 'View Activities_studentRegisterByParent', 2, 'Actions', 'Allows parents to register their children for activities', 'activities_view.php, activities_view_full.php, activities_view_register.php', 'activities_view.php', 'Y', 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'Y', 'N'),
(0000740, 0001, 'Manage Students Settings', 0, 'People', 'Manage settings for the Student module', 'studentsSettings.php', 'studentsSettings.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000782, 0001, 'Manage File Extensions', 0, 'Other', 'Manage file extensions allowed across the system', 'fileExtensions_manage.php,fileExtensions_manage_add.php,fileExtensions_manage_edit.php,fileExtensions_manage_delete.php', 'fileExtensions_manage.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'),
(0000794, 0014, 'View Available Spaces', 0, 'Reports', 'View unassigned rooms by timetable.', 'report_viewAvailableSpaces.php', 'report_viewAvailableSpaces.php', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `gibbonActivity`
--

CREATE TABLE `gibbonActivity` (
  `gibbonActivityID` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL DEFAULT '000',
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `name` varchar(40) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL,
  `gibbonSchoolYearTermIDList` text NOT NULL,
  `listingStart` date DEFAULT NULL,
  `listingEnd` date DEFAULT NULL,
  `programStart` date DEFAULT NULL,
  `programEnd` date DEFAULT NULL,
  `gibbonYearGroupIDList` varchar(255) NOT NULL DEFAULT '',
  `maxParticipants` int(3) NOT NULL DEFAULT '0',
  `description` text,
  `payment` decimal(8,2) NOT NULL,
  PRIMARY KEY (`gibbonActivityID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonActivitySlot`
--

CREATE TABLE `gibbonActivitySlot` (
  `gibbonActivitySlotID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonActivityID` int(8) unsigned zerofill NOT NULL,
  `gibbonSpaceID` int(5) unsigned zerofill DEFAULT NULL,
  `locationExternal` varchar(50) NOT NULL,
  `gibbonDaysOfWeekID` int(2) unsigned zerofill NOT NULL,
  `timeStart` time NOT NULL,
  `timeEnd` time NOT NULL,
  PRIMARY KEY (`gibbonActivitySlotID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonActivityStaff`
--

CREATE TABLE `gibbonActivityStaff` (
  `gibbonActivityStaffID` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonActivityID` int(8) unsigned zerofill NOT NULL DEFAULT '00000000',
  `gibbonPersonID` int(8) unsigned zerofill NOT NULL DEFAULT '00000000',
  `role` enum('Organiser','Coach','Assistant','Other') NOT NULL DEFAULT 'Organiser',
  PRIMARY KEY (`gibbonActivityStaffID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonActivityStudent`
--

CREATE TABLE `gibbonActivityStudent` (
  `gibbonActivityStudentID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonActivityID` int(8) unsigned zerofill NOT NULL DEFAULT '00000000',
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `status` enum('Accepted','Pending','Waiting List','Not Accepted') NOT NULL DEFAULT 'Pending',
  `timestamp` datetime NOT NULL,
  `gibbonActivityIDBackup` int(8) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`gibbonActivityStudentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonActivityStudentPayment`
--

CREATE TABLE `gibbonActivityStudentPayment` (
  `gibbonActivityStudentPaymentID` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `studentAcademicYearID` int(8) unsigned zerofill NOT NULL DEFAULT '00000000',
  `studentPaymentPrice` decimal(5,2) NOT NULL DEFAULT '0.00',
  `studentPaymentPaid` enum('Y','N') NOT NULL DEFAULT 'N',
  `studentPaymentDatePaid` date DEFAULT NULL,
  PRIMARY KEY (`gibbonActivityStudentPaymentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonAlertLevel`
--

CREATE TABLE `gibbonAlertLevel` (
  `gibbonAlertLevelID` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `color` varchar(6) NOT NULL COMMENT 'RGB Hex, no leading #',
  `colorBG` varchar(6) NOT NULL COMMENT 'RGB Hex, no leading #',
  `description` text NOT NULL,
  `sequenceNumber` int(3) NOT NULL,
  PRIMARY KEY (`gibbonAlertLevelID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `gibbonAlertLevel`
--

INSERT INTO `gibbonAlertLevel` (`gibbonAlertLevelID`, `name`, `nameShort`, `color`, `colorBG`, `description`, `sequenceNumber`) VALUES
(001, 'High', 'H', 'CC0000', 'F6CECB', 'Highest level of severity, requiring intense and immediate readiness, action, individual support or differentiation.', 3),
(002, 'Medium', 'M', 'FF7414', 'FFD2A9', 'Moderate severity, requiring intermediate level of readiness, action, individual support or differentiation.', 2),
(003, 'Low', 'L', '9f9f9f', 'dddddd', 'Low severity, requiring little to no readiness, action, individual support or differentiation.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gibbonApplicationForm`
--

CREATE TABLE `gibbonApplicationForm` (
  `gibbonApplicationFormID` int(12) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `surname` varchar(30) NOT NULL DEFAULT '',
  `firstName` varchar(30) NOT NULL DEFAULT '',
  `otherNames` varchar(30) NOT NULL DEFAULT '',
  `preferredName` varchar(30) NOT NULL DEFAULT '',
  `officialName` varchar(150) NOT NULL,
  `nameInCharacters` varchar(20) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `status` enum('Pending','Accepted','Rejected','Withdrawn') NOT NULL DEFAULT 'Pending',
  `dob` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address1` mediumtext NOT NULL,
  `address1District` varchar(255) NOT NULL,
  `address1Country` varchar(255) NOT NULL,
  `phone1Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone1CountryCode` varchar(7) NOT NULL,
  `phone1` varchar(20) NOT NULL,
  `phone2Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone2CountryCode` varchar(7) NOT NULL,
  `phone2` varchar(20) NOT NULL,
  `countryOfBirth` varchar(30) NOT NULL,
  `citizenship1` varchar(255) NOT NULL,
  `citizenship1Passport` varchar(30) NOT NULL,
  `nationalIDCardNumber` varchar(30) NOT NULL,
  `residencyStatus` varchar(255) NOT NULL,
  `visaExpiryDate` date DEFAULT NULL,
  `gibbonSchoolYearIDEntry` int(3) unsigned zerofill NOT NULL,
  `gibbonYearGroupIDEntry` int(3) unsigned zerofill NOT NULL,
  `dayType` varchar(255) DEFAULT NULL,
  `schoolName1` varchar(50) NOT NULL,
  `schoolAddress1` varchar(255) NOT NULL,
  `schoolGrades1` varchar(20) NOT NULL,
  `schoolLanguage1` varchar(50) NOT NULL,
  `schoolDate1` date DEFAULT NULL,
  `schoolName2` varchar(50) NOT NULL,
  `schoolAddress2` varchar(255) NOT NULL,
  `schoolGrades2` varchar(20) NOT NULL,
  `schoolLanguage2` varchar(50) NOT NULL,
  `schoolDate2` date DEFAULT NULL,
  `gibbonFamilyID` int(7) unsigned zerofill DEFAULT NULL,
  `siblingName1` varchar(50) NOT NULL,
  `siblingDOB1` date DEFAULT NULL,
  `siblingSchool1` varchar(50) NOT NULL,
  `siblingSchoolJoiningDate1` date DEFAULT NULL,
  `siblingName2` varchar(50) NOT NULL,
  `siblingDOB2` date DEFAULT NULL,
  `siblingSchool2` varchar(50) NOT NULL,
  `siblingSchoolJoiningDate2` date DEFAULT NULL,
  `siblingName3` varchar(50) NOT NULL,
  `siblingDOB3` date DEFAULT NULL,
  `siblingSchool3` varchar(50) NOT NULL,
  `siblingSchoolJoiningDate3` date DEFAULT NULL,
  `languageHome` varchar(30) NOT NULL,
  `languageFirst` varchar(30) NOT NULL,
  `languageSecond` varchar(30) NOT NULL,
  `languageThird` varchar(30) NOT NULL,
  `medicalInformation` text NOT NULL,
  `developmentInformation` text NOT NULL,
  `languageChoice` varchar(100) DEFAULT NULL,
  `languageChoiceExperience` text,
  `scholarshipInterest` enum('N','Y') NOT NULL DEFAULT 'N',
  `scholarshipRequired` enum('N','Y') NOT NULL DEFAULT 'N',
  `payment` enum('Family','Company') NOT NULL DEFAULT 'Family',
  `companyName` varchar(100) NOT NULL,
  `companyContact` varchar(100) NOT NULL,
  `companyAddress` varchar(255) NOT NULL,
  `companyEmail` varchar(255) NOT NULL,
  `companyPhone` varchar(20) NOT NULL,
  `agreement` enum('N','Y') NOT NULL DEFAULT 'N',
  `parent1gibbonPersonID` int(10) unsigned zerofill DEFAULT NULL,
  `parent1title` varchar(5) NOT NULL,
  `parent1surname` varchar(30) NOT NULL DEFAULT '',
  `parent1firstName` varchar(30) NOT NULL DEFAULT '',
  `parent1otherNames` varchar(30) NOT NULL DEFAULT '',
  `parent1preferredName` varchar(30) NOT NULL DEFAULT '',
  `parent1officialName` varchar(150) NOT NULL,
  `parent1nameInCharacters` varchar(20) NOT NULL,
  `parent1gender` enum('M','F') NOT NULL DEFAULT 'M',
  `parent1relationship` varchar(50) NOT NULL,
  `parent1languageFirst` varchar(30) NOT NULL,
  `parent1languageSecond` varchar(30) NOT NULL,
  `parent1citizenship1` varchar(255) NOT NULL,
  `parent1nationalIDCardNumber` varchar(30) NOT NULL,
  `parent1residencyStatus` varchar(255) NOT NULL,
  `parent1visaExpiryDate` date DEFAULT NULL,
  `parent1email` varchar(50) DEFAULT NULL,
  `parent1address1` mediumtext NOT NULL,
  `parent1address1District` varchar(255) NOT NULL,
  `parent1address1Country` varchar(255) NOT NULL,
  `parent1phone1Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `parent1phone1CountryCode` varchar(7) NOT NULL,
  `parent1phone1` varchar(20) NOT NULL,
  `parent1phone2Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `parent1phone2CountryCode` varchar(7) NOT NULL,
  `parent1phone2` varchar(20) NOT NULL,
  `parent1contactCall` enum('Y','N') NOT NULL DEFAULT 'Y',
  `parent1contactSMS` enum('Y','N') NOT NULL DEFAULT 'Y',
  `parent1contactEmail` enum('Y','N') NOT NULL DEFAULT 'Y',
  `parent1contactMail` enum('Y','N') NOT NULL DEFAULT 'Y',
  `parent1profession` varchar(30) DEFAULT NULL,
  `parent1employer` varchar(30) DEFAULT NULL,
  `parent2title` varchar(5) NOT NULL,
  `parent2surname` varchar(30) NOT NULL DEFAULT '',
  `parent2firstName` varchar(30) NOT NULL DEFAULT '',
  `parent2otherNames` varchar(30) NOT NULL DEFAULT '',
  `parent2preferredName` varchar(30) NOT NULL DEFAULT '',
  `parent2officialName` varchar(150) NOT NULL,
  `parent2nameInCharacters` varchar(20) NOT NULL,
  `parent2gender` enum('M','F') NOT NULL DEFAULT 'M',
  `parent2relationship` varchar(50) NOT NULL,
  `parent2languageFirst` varchar(30) NOT NULL,
  `parent2languageSecond` varchar(30) NOT NULL,
  `parent2citizenship1` varchar(255) NOT NULL,
  `parent2nationalIDCardNumber` varchar(30) NOT NULL,
  `parent2residencyStatus` varchar(255) NOT NULL,
  `parent2visaExpiryDate` date DEFAULT NULL,
  `parent2email` varchar(50) DEFAULT NULL,
  `parent2address1` mediumtext NOT NULL,
  `parent2address1District` varchar(255) NOT NULL,
  `parent2address1Country` varchar(255) NOT NULL,
  `parent2phone1Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `parent2phone1CountryCode` varchar(7) NOT NULL,
  `parent2phone1` varchar(20) NOT NULL,
  `parent2phone2Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `parent2phone2CountryCode` varchar(7) NOT NULL,
  `parent2phone2` varchar(20) NOT NULL,
  `parent2contactCall` enum('Y','N') NOT NULL DEFAULT 'Y',
  `parent2contactSMS` enum('Y','N') NOT NULL DEFAULT 'Y',
  `parent2contactEmail` enum('Y','N') NOT NULL DEFAULT 'Y',
  `parent2contactMail` enum('Y','N') NOT NULL DEFAULT 'Y',
  `parent2profession` varchar(30) DEFAULT NULL,
  `parent2employer` varchar(30) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `priority` int(1) NOT NULL DEFAULT '0',
  `milestones` text NOT NULL,
  `notes` text NOT NULL,
  `dateStart` date DEFAULT NULL,
  `gibbonRollGroupID` int(5) unsigned zerofill DEFAULT NULL,
  `howDidYouHear` varchar(255) DEFAULT NULL,
  `howDidYouHearMore` varchar(255) DEFAULT NULL,
  `paymentMade` enum('N','Y','Exemption') NOT NULL DEFAULT 'N',
  `paypalPaymentToken` varchar(50) NOT NULL,
  `paypalPaymentPayerID` varchar(50) NOT NULL,
  PRIMARY KEY (`gibbonApplicationFormID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonApplicationFormFile`
--

CREATE TABLE `gibbonApplicationFormFile` (
  `gibbonApplicationFormFileID` int(14) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonApplicationFormID` int(12) unsigned zerofill NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`gibbonApplicationFormFileID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonApplicationFormRelationship`
--

CREATE TABLE `gibbonApplicationFormRelationship` (
  `gibbonApplicationFormRelationshipID` int(14) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonApplicationFormID` int(12) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `relationship` varchar(50) NOT NULL,
  PRIMARY KEY (`gibbonApplicationFormRelationshipID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonAttendanceLogPerson`
--

CREATE TABLE `gibbonAttendanceLogPerson` (
  `gibbonAttendanceLogPersonID` int(14) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `direction` enum('In','Out') NOT NULL,
  `type` enum('Present','Present - Late','Present - Offsite','Absent','Left','Left - Early') NOT NULL,
  `reason` enum('','Pending','Education','Family','Medical','Other') NOT NULL DEFAULT '',
  `comment` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `gibbonPersonIDTaker` int(10) unsigned zerofill NOT NULL,
  `timestampTaken` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gibbonAttendanceLogPersonID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonAttendanceLogRollGroup`
--

CREATE TABLE `gibbonAttendanceLogRollGroup` (
  `gibbonAttendanceLogRollGroupID` int(14) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonRollGroupID` int(5) unsigned zerofill NOT NULL,
  `gibbonPersonIDTaker` int(10) unsigned zerofill NOT NULL,
  `date` date DEFAULT NULL,
  `timestampTaken` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonAttendanceLogRollGroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonBehaviour`
--

CREATE TABLE `gibbonBehaviour` (
  `gibbonBehaviourID` int(12) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `date` date NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `type` enum('Positive','Negative') CHARACTER SET utf8 NOT NULL,
  `descriptor` varchar(100) CHARACTER SET utf8 NOT NULL,
  `level` varchar(100) CHARACTER SET utf8 NOT NULL,
  `comment` text CHARACTER SET utf8 NOT NULL,
  `gibbonPlannerEntryID` int(14) unsigned zerofill DEFAULT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonBehaviourID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonCountry`
--

CREATE TABLE `gibbonCountry` (
  `printable_name` varchar(80) NOT NULL,
  `iddCountryCode` varchar(7) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gibbonCountry`
--

INSERT INTO `gibbonCountry` (`printable_name`, `iddCountryCode`) VALUES
('Afghanistan', '93'),
('Albania', '355'),
('Algeria', '213'),
('American Samoa', '1 684'),
('Andorra', '376'),
('Angola', '244'),
('Anguilla', '1 264'),
('Antarctica', '672'),
('Antigua and Barbuda', '1 268'),
('Argentina', '54'),
('Armenia', '374'),
('Aruba', '297'),
('Australia', '61'),
('Austria', '43'),
('Azerbaijan', '994'),
('Bahamas', '1 242'),
('Bahrain', '973'),
('Bangladesh', '880'),
('Barbados', '1 246'),
('Belarus', '375'),
('Belgium', '32'),
('Belize', '501'),
('Benin', '229'),
('Bermuda', '1 441'),
('Bhutan', '975'),
('Bolivia', '591'),
('Bosnia and Herzegovina', '387'),
('Botswana', '267'),
('Bouvet Island', ''),
('Brazil', '55'),
('British Indian Ocean Territory', ''),
('Brunei Darussalam', ''),
('Bulgaria', '359'),
('Burkina Faso', '226'),
('Burundi', '257'),
('Cambodia', '855'),
('Cameroon', '237'),
('Canada', '1'),
('Cape Verde', '238'),
('Cayman Islands', '1 345'),
('Central African Republic', '236'),
('Chad', '235'),
('Chile', '56'),
('China', '86'),
('Christmas Island', '61'),
('Cocos (Keeling) Islands', '61'),
('Colombia', '57'),
('Comoros', '269'),
('Congo', ''),
('Congo, the Democratic Republic of the', ''),
('Cook Islands', '682'),
('Costa Rica', '506'),
('Cote D''Ivoire', ''),
('Croatia', '385'),
('Cuba', '53'),
('Cyprus', '357'),
('Czech Republic', '420'),
('Denmark', '45'),
('Djibouti', '253'),
('Dominica', '1 767'),
('Dominican Republic', '1 809'),
('Ecuador', '593'),
('Egypt', '20'),
('El Salvador', '503'),
('Equatorial Guinea', '240'),
('Eritrea', '291'),
('Estonia', '372'),
('Ethiopia', '251'),
('Falkland Islands (Malvinas)', ''),
('Faroe Islands', '298'),
('Fiji', '679'),
('Finland', '358'),
('France', '33'),
('French Guiana', ''),
('French Polynesia', '689'),
('French Southern Territories', ''),
('Gabon', '241'),
('Gambia', '220'),
('Georgia', '995'),
('Germany', '49'),
('Ghana', '233'),
('Gibraltar', '350'),
('Greece', '30'),
('Greenland', '299'),
('Grenada', '1 473'),
('Guadeloupe', ''),
('Guam', '1 671'),
('Guatemala', '502'),
('Guinea', '224'),
('Guinea-Bissau', '245'),
('Guyana', '592'),
('Haiti', '509'),
('Heard Island and Mcdonald Islands', ''),
('Holy See (Vatican City State)', ''),
('Honduras', '504'),
('Hong Kong', '852'),
('Hungary', '36'),
('Iceland', '354'),
('India', '91'),
('Indonesia', '62'),
('Iran, Islamic Republic of', ''),
('Iraq', '964'),
('Ireland', '353'),
('Israel', '972'),
('Italy', '39'),
('Jamaica', '1 876'),
('Japan', '81'),
('Jordan', '962'),
('Kazakhstan', '7'),
('Kenya', '254'),
('Kiribati', '686'),
('Korea, Democratic People''s Republic of', ''),
('Korea, Republic of', ''),
('Kuwait', '965'),
('Kyrgyzstan', '996'),
('Lao People''s Democratic Republic', ''),
('Latvia', '371'),
('Lebanon', '961'),
('Lesotho', '266'),
('Liberia', '231'),
('Libyan Arab Jamahiriya', ''),
('Liechtenstein', '423'),
('Lithuania', '370'),
('Luxembourg', '352'),
('Macao', ''),
('Macedonia, the Former Yugoslav Republic of', ''),
('Madagascar', '261'),
('Malawi', '265'),
('Malaysia', '60'),
('Maldives', '960'),
('Mali', '223'),
('Malta', '356'),
('Marshall Islands', '692'),
('Martinique', ''),
('Mauritania', '222'),
('Mauritius', '230'),
('Mayotte', '262'),
('Mexico', '52'),
('Micronesia, Federated States of', ''),
('Moldova, Republic of', ''),
('Monaco', '377'),
('Mongolia', '976'),
('Montserrat', '1 664'),
('Morocco', '212'),
('Mozambique', '258'),
('Myanmar', ''),
('Namibia', '264'),
('Nauru', '674'),
('Nepal', '977'),
('Netherlands', '31'),
('Netherlands Antilles', '599'),
('New Caledonia', '687'),
('New Zealand', '64'),
('Nicaragua', '505'),
('Niger', '227'),
('Nigeria', '234'),
('Niue', '683'),
('Norfolk Island', '672'),
('Northern Mariana Islands', '1 670'),
('Norway', '47'),
('Oman', '968'),
('Pakistan', '92'),
('Palau', '680'),
('Palestinian Territory, Occupied', ''),
('Panama', '507'),
('Papua New Guinea', '675'),
('Paraguay', '595'),
('Peru', '51'),
('Philippines', '63'),
('Pitcairn', ''),
('Poland', '48'),
('Portugal', '351'),
('Puerto Rico', '1'),
('Qatar', '974'),
('Reunion', ''),
('Romania', '40'),
('Russian Federation', ''),
('Rwanda', '250'),
('Saint Helena', '290'),
('Saint Kitts and Nevis', '1 869'),
('Saint Lucia', '1 758'),
('Saint Pierre and Miquelon', '508'),
('Saint Vincent and the Grenadines', '1 784'),
('Samoa', '685'),
('San Marino', '378'),
('Sao Tome and Principe', '239'),
('Saudi Arabia', '966'),
('Senegal', '221'),
('Serbia and Montenegro', ''),
('Seychelles', '248'),
('Sierra Leone', '232'),
('Singapore', '65'),
('Slovakia', '421'),
('Slovenia', '386'),
('Solomon Islands', '677'),
('Somalia', '252'),
('South Africa', '27'),
('South Georgia and the South Sandwich Islands', ''),
('Spain', '34'),
('Sri Lanka', '94'),
('Sudan', '249'),
('Suriname', '597'),
('Svalbard and Jan Mayen', ''),
('Swaziland', '268'),
('Sweden', '46'),
('Switzerland', '41'),
('Syrian Arab Republic', ''),
('Taiwan', '886'),
('Tajikistan', '992'),
('Tanzania, United Republic of', ''),
('Thailand', '66'),
('Timor-Leste', '670'),
('Togo', '228'),
('Tokelau', '690'),
('Tonga', '676'),
('Trinidad and Tobago', '1 868'),
('Tunisia', '216'),
('Turkey', '90'),
('Turkmenistan', '993'),
('Turks and Caicos Islands', '1 649'),
('Tuvalu', '688'),
('Uganda', '256'),
('Ukraine', '380'),
('United Arab Emirates', '971'),
('United Kingdom', '44'),
('United States', '1'),
('United States Minor Outlying Islands', ''),
('Uruguay', '598'),
('Uzbekistan', '998'),
('Vanuatu', '678'),
('Venezuela', '58'),
('Viet Nam', ''),
('Virgin Islands, British', ''),
('Virgin Islands, U.s.', ''),
('Wallis and Futuna', '681'),
('Western Sahara', ''),
('Yemen', '967'),
('Zambia', '260'),
('Zimbabwe', '263');

-- --------------------------------------------------------

--
-- Table structure for table `gibbonCourse`
--

CREATE TABLE `gibbonCourse` (
  `gibbonCourseID` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `gibbonDepartmentID` int(4) unsigned zerofill DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `nameShort` varchar(6) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `gibbonYearGroupIDList` varchar(255) NOT NULL,
  PRIMARY KEY (`gibbonCourseID`),
  UNIQUE KEY `nameYear` (`gibbonSchoolYearID`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonCourseClass`
--

CREATE TABLE `gibbonCourseClass` (
  `gibbonCourseClassID` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonCourseID` int(8) unsigned zerofill NOT NULL,
  `name` varchar(12) NOT NULL DEFAULT '',
  `nameShort` varchar(5) NOT NULL,
  `reportable` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`gibbonCourseClassID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonCourseClassPerson`
--

CREATE TABLE `gibbonCourseClassPerson` (
  `gibbonCourseClassPersonID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonCourseClassID` int(8) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `role` enum('Student','Teacher','Assistant','Technician','Parent','Student - Left','Teacher - Left') NOT NULL,
  PRIMARY KEY (`gibbonCourseClassPersonID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonCrowdAssessDiscuss`
--

CREATE TABLE `gibbonCrowdAssessDiscuss` (
  `gibbonCrowdAssessDiscussID` int(16) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonPlannerEntryHomeworkID` int(16) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` text NOT NULL,
  `gibbonCrowdAssessDiscussIDReplyTo` int(16) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`gibbonCrowdAssessDiscussID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonCrowdAssessLike`
--

CREATE TABLE `gibbonCrowdAssessLike` (
  `gibbonCrowdAssessLikeID` int(16) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonPlannerEntryHomeworkID` int(16) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonCrowdAssessLikeID`),
  UNIQUE KEY `gibbonPlannerEntryHomeworkID` (`gibbonPlannerEntryHomeworkID`,`gibbonPersonID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonDaysOfWeek`
--

CREATE TABLE `gibbonDaysOfWeek` (
  `gibbonDaysOfWeekID` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `sequenceNumber` int(2) NOT NULL,
  `schoolDay` enum('Y','N') NOT NULL DEFAULT 'Y',
  `schoolOpen` time DEFAULT NULL,
  `schoolStart` time DEFAULT NULL,
  `schoolEnd` time DEFAULT NULL,
  `schoolClose` time DEFAULT NULL,
  PRIMARY KEY (`gibbonDaysOfWeekID`),
  UNIQUE KEY `name` (`name`,`nameShort`),
  UNIQUE KEY `sequenceNumber` (`sequenceNumber`),
  UNIQUE KEY `nameShort` (`nameShort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `gibbonDaysOfWeek`
--

INSERT INTO `gibbonDaysOfWeek` (`gibbonDaysOfWeekID`, `name`, `nameShort`, `sequenceNumber`, `schoolDay`, `schoolOpen`, `schoolStart`, `schoolEnd`, `schoolClose`) VALUES
(01, 'Monday', 'Mon', 0, 'Y', NULL, NULL, NULL, NULL),
(02, 'Tuesday', 'Tue', 2, 'Y', '07:45:00', '08:30:00', '15:30:00', '17:00:00'),
(03, 'Wednesday', 'Wed', 3, 'Y', '07:45:00', '08:30:00', '15:30:00', '17:00:00'),
(04, 'Thursday', 'Thu', 4, 'Y', '07:45:00', '08:30:00', '15:30:00', '17:00:00'),
(05, 'Friday', 'Fri', 5, 'Y', '07:45:00', '08:30:00', '15:30:00', '17:00:00'),
(06, 'Saturday', 'Sat', 6, 'N', NULL, NULL, NULL, NULL),
(07, 'Sunday', 'Sun', 7, 'N', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gibbonDepartment`
--

CREATE TABLE `gibbonDepartment` (
  `gibbonDepartmentID` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `type` enum('Learning Area','Administration') NOT NULL DEFAULT 'Learning Area',
  `name` varchar(40) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `subjectListing` varchar(255) NOT NULL,
  `blurb` text NOT NULL,
  `logo` varchar(255) NOT NULL,
  PRIMARY KEY (`gibbonDepartmentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonDepartmentResource`
--

CREATE TABLE `gibbonDepartmentResource` (
  `gibbonDepartmentResourceID` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonDepartmentID` int(4) unsigned zerofill NOT NULL,
  `type` enum('Link','File') NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`gibbonDepartmentResourceID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonDepartmentStaff`
--

CREATE TABLE `gibbonDepartmentStaff` (
  `gibbonDepartmentStaffID` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonDepartmentID` int(4) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `role` enum('Coordinator','Assistant Coordinator','Teacher (Curriculum)','Teacher','Director','Manager','Administrator','Other') NOT NULL,
  PRIMARY KEY (`gibbonDepartmentStaffID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonExternalAssessment`
--

CREATE TABLE `gibbonExternalAssessment` (
  `gibbonExternalAssessmentID` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `nameShort` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `website` text NOT NULL,
  `active` enum('Y','N') NOT NULL,
  PRIMARY KEY (`gibbonExternalAssessmentID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `gibbonExternalAssessment`
--

INSERT INTO `gibbonExternalAssessment` (`gibbonExternalAssessmentID`, `name`, `nameShort`, `description`, `website`, `active`) VALUES
(0001, 'Cognitive Abilities Test', 'CAT', 'UK-based standardised tests that provides scores in maths, verbal and non-verbal skills, as well as KS3 and GCSE predicted grades.', '', 'Y'),
(0002, 'GCSE/iGCSE', 'GCSE', 'UK-based General Certificate of Secondary Education', '', 'Y'),
(0003, 'IB Diploma', 'IB Diploma', 'International Baccalaureate Diploma', 'http://www.ibo.org/', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `gibbonExternalAssessmentField`
--

CREATE TABLE `gibbonExternalAssessmentField` (
  `gibbonExternalAssessmentFieldID` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonExternalAssessmentID` int(4) unsigned zerofill NOT NULL,
  `name` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `order` int(4) NOT NULL,
  `gibbonScaleID` int(5) unsigned zerofill NOT NULL,
  `gibbonYearGroupIDList` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gibbonExternalAssessmentFieldID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

--
-- Dumping data for table `gibbonExternalAssessmentField`
--

INSERT INTO `gibbonExternalAssessmentField` (`gibbonExternalAssessmentFieldID`, `gibbonExternalAssessmentID`, `name`, `category`, `order`, `gibbonScaleID`, `gibbonYearGroupIDList`) VALUES
(000001, 0001, 'Maths', '1_Scores', 1, 00010, NULL),
(000002, 0001, 'Non-Verbal', '1_Scores', 2, 00010, NULL),
(000003, 0001, 'Verbal', '1_Scores', 3, 00010, NULL),
(000004, 0001, 'English', '2_KS3 Target Grades', 3, 00011, '001,002,003'),
(000005, 0001, 'Maths', '2_KS3 Target Grades', 7, 00011, '001,002,003'),
(000006, 0001, 'Science', '2_KS3 Target Grades', 11, 00011, '001,002,003'),
(000007, 0001, 'English Language', '3_GCSE Target Grades', 10, 00012, '004,005'),
(000008, 0001, 'Mathematics', '3_GCSE Target Grades', 18, 00012, '004,005'),
(000009, 0001, 'Science - Double Award', '3_GCSE Target Grades', 25, 00012, '004,005'),
(000010, 0001, 'Art & Design', '2_KS3 Target Grades', 1, 00011, '001,002,003'),
(000011, 0001, 'Design & Tech', '2_KS3 Target Grades', 2, 00011, '001,002,003'),
(000012, 0001, 'Geography', '2_KS3 Target Grades', 4, 00011, '001,002,003'),
(000013, 0001, 'History', '2_KS3 Target Grades', 5, 00011, '001,002,003'),
(000014, 0001, 'ICT', '2_KS3 Target Grades', 6, 00011, '001,002,003'),
(000015, 0001, 'MFL', '2_KS3 Target Grades', 8, 00011, '001,002,003'),
(000016, 0001, 'Music', '2_KS3 Target Grades', 9, 00011, '001,002,003'),
(000017, 0001, 'PE', '2_KS3 Target Grades', 10, 00011, '001,002,003'),
(000018, 0001, 'Art & Design', '3_GCSE Target Grades', 1, 00012, '004,005'),
(000019, 0001, 'Business Studies', '3_GCSE Target Grades', 2, 00012, '004,005'),
(000020, 0001, 'D&T - Electronics', '3_GCSE Target Grades', 3, 00012, '004,005'),
(000021, 0001, 'D&T - Food', '3_GCSE Target Grades', 4, 00012, '004,005'),
(000022, 0001, 'D&T - Graphics', '3_GCSE Target Grades', 5, 00012, '004,005'),
(000023, 0001, 'D&T - Resistant Materials', '3_GCSE Target Grades', 6, 00012, '004,005'),
(000024, 0001, 'D&T - Systems Control', '3_GCSE Target Grades', 7, 00012, '004,005'),
(000025, 0001, 'D&T - Textiles', '3_GCSE Target Grades', 8, 00012, '004,005'),
(000026, 0001, 'Drama', '3_GCSE Target Grades', 9, 00012, '004,005'),
(000027, 0001, 'English Literature', '3_GCSE Target Grades', 11, 00012, '004,005'),
(000028, 0001, 'French', '3_GCSE Target Grades', 12, 00012, '004,005'),
(000029, 0001, 'Geography', '3_GCSE Target Grades', 13, 00012, '004,005'),
(000030, 0001, 'German', '3_GCSE Target Grades', 14, 00012, '004,005'),
(000031, 0001, 'History', '3_GCSE Target Grades', 15, 00012, '004,005'),
(000032, 0001, 'Home Economics', '3_GCSE Target Grades', 16, 00012, '004,005'),
(000033, 0001, 'Information Technology', '3_GCSE Target Grades', 17, 00012, '004,005'),
(000034, 0001, 'Media Studies', '3_GCSE Target Grades', 19, 00012, '004,005'),
(000035, 0001, 'Music', '3_GCSE Target Grades', 20, 00012, '004,005'),
(000036, 0001, 'Physical Education', '3_GCSE Target Grades', 21, 00012, '004,005'),
(000037, 0001, 'Religious Education', '3_GCSE Target Grades', 22, 00012, '004,005'),
(000038, 0001, 'Science - Biology', '3_GCSE Target Grades', 23, 00012, '004,005'),
(000039, 0001, 'Science - Chemistry', '3_GCSE Target Grades', 24, 00012, '004,005'),
(000040, 0001, 'Science - Physics', '3_GCSE Target Grades', 26, 00012, '004,005'),
(000041, 0001, 'Science - Single Award', '3_GCSE Target Grades', 27, 00012, '004,005'),
(000042, 0001, 'Sociology', '3_GCSE Target Grades', 28, 00012, '004,005'),
(000043, 0001, 'Spanish', '3_GCSE Target Grades', 29, 00012, '004,005'),
(000044, 0001, 'Statistics', '3_GCSE Target Grades', 30, 00012, '004,005'),
(000045, 0002, 'Art & Design', '1_Final Grade', 1, 00003, '004,005'),
(000046, 0002, 'Chinese (Mandarin)', '1_Final Grade', 2, 00003, '004,005'),
(000047, 0002, 'Drama', '1_Final Grade', 3, 00003, '004,005'),
(000048, 0002, 'Dutch', '1_Final Grade', 4, 00003, '004,005'),
(000049, 0002, 'Economics', '1_Final Grade', 5, 00003, '004,005'),
(000050, 0002, 'English Language', '1_Final Grade', 6, 00003, '004,005'),
(000051, 0002, 'English Literature', '1_Final Grade', 7, 00003, '004,005'),
(000052, 0002, 'Environmental Management', '1_Final Grade', 8, 00003, '004,005'),
(000053, 0002, 'Mathematics', '1_Final Grade', 9, 00003, '004,005'),
(000054, 0002, 'Media Studies', '1_Final Grade', 10, 00003, '004,005'),
(000055, 0002, 'Physical Education', '1_Final Grade', 11, 00003, '004,005'),
(000056, 0002, 'Science - Double Award', '1_Final Grade', 12, 00003, '004,005'),
(000057, 0002, 'Spanish', '1_Final Grade', 13, 00003, '004,005'),
(000058, 0002, 'Art & Design', '0_Target Grade', 1, 00012, '004,005'),
(000059, 0002, 'Chinese (Mandarin)', '0_Target Grade', 2, 00012, '004,005'),
(000060, 0002, 'Drama', '0_Target Grade', 3, 00012, '004,005'),
(000061, 0002, 'Dutch', '0_Target Grade', 4, 00012, '004,005'),
(000062, 0002, 'Economics', '0_Target Grade', 5, 00012, '004,005'),
(000063, 0002, 'English Language', '0_Target Grade', 6, 00012, '004,005'),
(000064, 0002, 'English Literature', '0_Target Grade', 7, 00012, '004,005'),
(000065, 0002, 'Environmental Management', '0_Target Grade', 8, 00012, '004,005'),
(000066, 0002, 'Mathematics', '0_Target Grade', 9, 00012, '004,005'),
(000067, 0002, 'Media Studies', '0_Target Grade', 10, 00012, '004,005'),
(000068, 0002, 'Physical Education', '0_Target Grade', 11, 00012, '004,005'),
(000069, 0002, 'Science - Double Award', '0_Target Grade', 12, 00012, '004,005'),
(000070, 0002, 'Spanish', '0_Target Grade', 13, 00012, '004,005'),
(000071, 0003, 'IB Diploma Total', '0_Target Grade', 0, 00014, '006,007'),
(000072, 0003, 'IB Diploma Total', '1_Final Grade', 0, 00014, '006,007'),
(000073, 0003, 'Chinese A: Language and Literature HL', '0_Target Grade', 1, 00013, '006,007'),
(000074, 0003, 'Chinese A: Language and Literature SL', '0_Target Grade', 2, 00013, '006,007'),
(000075, 0003, 'English A: Language and Literature HL', '0_Target Grade', 3, 00013, '006,007'),
(000076, 0003, 'English A: Language and Literature SL', '0_Target Grade', 4, 00013, '006,007'),
(000077, 0003, 'English A: Literature HL', '0_Target Grade', 5, 00013, '006,007'),
(000078, 0003, 'English A: Literature SL', '0_Target Grade', 6, 00013, '006,007'),
(000079, 0003, 'Self-Taught Language SL', '0_Target Grade', 7, 00013, '006,007'),
(000080, 0003, 'Chinese B HL', '0_Target Grade', 8, 00013, '006,007'),
(000081, 0003, 'Chinese B SL', '0_Target Grade', 9, 00013, '006,007'),
(000082, 0003, 'Spanish B HL', '0_Target Grade', 10, 00013, '006,007'),
(000083, 0003, 'Spanish B SL', '0_Target Grade', 11, 00013, '006,007'),
(000084, 0003, 'Italian ab initio SL', '0_Target Grade', 12, 00013, '006,007'),
(000085, 0003, 'Economics HL', '0_Target Grade', 13, 00013, '006,007'),
(000086, 0003, 'Economics SL', '0_Target Grade', 14, 00013, '006,007'),
(000087, 0003, 'Psychology HL', '0_Target Grade', 15, 00013, '006,007'),
(000088, 0003, 'Psychology SL', '0_Target Grade', 16, 00013, '006,007'),
(000089, 0003, 'Environmental Systems and Society SL', '0_Target Grade', 17, 00013, '006,007'),
(000090, 0003, 'Chemistry HL', '0_Target Grade', 18, 00013, '006,007'),
(000091, 0003, 'Chemistry SL', '0_Target Grade', 19, 00013, '006,007'),
(000092, 0003, 'Physics HL', '0_Target Grade', 20, 00013, '006,007'),
(000093, 0003, 'Physics SL', '0_Target Grade', 21, 00013, '006,007'),
(000094, 0003, 'Mathematics HL', '0_Target Grade', 22, 00013, '006,007'),
(000095, 0003, 'Mathematics SL', '0_Target Grade', 23, 00013, '006,007'),
(000096, 0003, 'Maths Studies SL', '0_Target Grade', 24, 00013, '006,007'),
(000097, 0003, 'Theatre Arts HL', '0_Target Grade', 25, 00013, '006,007'),
(000098, 0003, 'Theatre Arts SL', '0_Target Grade', 26, 00013, '006,007'),
(000099, 0003, 'Visual Arts HL', '0_Target Grade', 27, 00013, '006,007'),
(000100, 0003, 'Visual Arts SL', '0_Target Grade', 28, 00013, '006,007'),
(000101, 0003, 'Chinese A: Language and Literature HL', '1_Final Grade', 1, 00013, '006,007'),
(000102, 0003, 'Chinese A: Language and Literature SL', '1_Final Grade', 2, 00013, '006,007'),
(000103, 0003, 'English A: Language and Literature HL', '1_Final Grade', 3, 00013, '006,007'),
(000104, 0003, 'English A: Language and Literature SL', '1_Final Grade', 4, 00013, '006,007'),
(000105, 0003, 'English A: Literature HL', '1_Final Grade', 5, 00013, '006,007'),
(000106, 0003, 'English A: Literature SL', '1_Final Grade', 6, 00013, '006,007'),
(000107, 0003, 'Self-Taught Language SL', '1_Final Grade', 7, 00013, '006,007'),
(000108, 0003, 'Chinese B HL', '1_Final Grade', 8, 00013, '006,007'),
(000109, 0003, 'Chinese B SL', '1_Final Grade', 9, 00013, '006,007'),
(000110, 0003, 'Spanish B HL', '1_Final Grade', 10, 00013, '006,007'),
(000111, 0003, 'Spanish B SL', '1_Final Grade', 11, 00013, '006,007'),
(000112, 0003, 'Italian ab initio SL', '1_Final Grade', 12, 00013, '006,007'),
(000113, 0003, 'Economics HL', '1_Final Grade', 13, 00013, '006,007'),
(000114, 0003, 'Economics SL', '1_Final Grade', 14, 00013, '006,007'),
(000115, 0003, 'Psychology HL', '1_Final Grade', 15, 00013, '006,007'),
(000116, 0003, 'Psychology SL', '1_Final Grade', 16, 00013, '006,007'),
(000117, 0003, 'Environmental Systems and Society SL', '1_Final Grade', 17, 00013, '006,007'),
(000118, 0003, 'Chemistry HL', '1_Final Grade', 18, 00013, '006,007'),
(000119, 0003, 'Chemistry SL', '1_Final Grade', 19, 00013, '006,007'),
(000120, 0003, 'Physics HL', '1_Final Grade', 20, 00013, '006,007'),
(000121, 0003, 'Physics SL', '1_Final Grade', 21, 00013, '006,007'),
(000122, 0003, 'Mathematics HL', '1_Final Grade', 22, 00013, '006,007'),
(000123, 0003, 'Mathematics SL', '1_Final Grade', 23, 00013, '006,007'),
(000124, 0003, 'Maths Studies SL', '1_Final Grade', 24, 00013, '006,007'),
(000125, 0003, 'Theatre Arts HL', '1_Final Grade', 25, 00013, '006,007'),
(000126, 0003, 'Theatre Arts SL', '1_Final Grade', 26, 00013, '006,007'),
(000127, 0003, 'Visual Arts HL', '1_Final Grade', 27, 00013, '006,007'),
(000128, 0003, 'Visual Arts SL', '1_Final Grade', 28, 00013, '006,007');

-- --------------------------------------------------------

--
-- Table structure for table `gibbonExternalAssessmentStudent`
--

CREATE TABLE `gibbonExternalAssessmentStudent` (
  `gibbonExternalAssessmentStudentID` int(12) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonExternalAssessmentID` int(4) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`gibbonExternalAssessmentStudentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonExternalAssessmentStudentEntry`
--

CREATE TABLE `gibbonExternalAssessmentStudentEntry` (
  `gibbonExternalAssessmentStudentEntryID` int(14) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonExternalAssessmentStudentID` int(12) unsigned zerofill NOT NULL,
  `gibbonExternalAssessmentFieldID` int(6) unsigned zerofill NOT NULL,
  `gibbonScaleGradeID` int(7) unsigned zerofill DEFAULT NULL COMMENT 'Key for the actual grade achieved',
  `gibbonScaleGradeIDPrimaryAssessmentScale` int(7) unsigned zerofill DEFAULT NULL COMMENT 'Key for the equivalent grade on the school''s primary assessment scale',
  PRIMARY KEY (`gibbonExternalAssessmentStudentEntryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonFamily`
--

CREATE TABLE `gibbonFamily` (
  `gibbonFamilyID` int(7) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `nameAddress` varchar(100) NOT NULL COMMENT 'The formal name to be used for addressing the family (e.g. Mr. & Mrs. Smith)',
  `status` enum('Married','Separated','Divorced','De Facto','Other') NOT NULL,
  `languageHome` varchar(30) NOT NULL,
  PRIMARY KEY (`gibbonFamilyID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonFamilyAdult`
--

CREATE TABLE `gibbonFamilyAdult` (
  `gibbonFamilyAdultID` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonFamilyID` int(7) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(8) unsigned zerofill NOT NULL,
  `comment` text NOT NULL,
  `childDataAccess` enum('Y','N') NOT NULL,
  `contactPriority` int(2) NOT NULL DEFAULT '1',
  `contactCall` enum('Y','N') NOT NULL,
  `contactSMS` enum('Y','N') NOT NULL,
  `contactEmail` enum('Y','N') NOT NULL,
  `contactMail` enum('Y','N') NOT NULL,
  PRIMARY KEY (`gibbonFamilyAdultID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonFamilyChild`
--

CREATE TABLE `gibbonFamilyChild` (
  `gibbonFamilyChildID` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonFamilyID` int(7) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(8) unsigned zerofill NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`gibbonFamilyChildID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonFamilyRelationship`
--

CREATE TABLE `gibbonFamilyRelationship` (
  `gibbonFamilyRelationshipID` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonFamilyID` int(7) unsigned zerofill NOT NULL,
  `gibbonPersonID1` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonID2` int(10) unsigned zerofill NOT NULL,
  `relationship` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`gibbonFamilyRelationshipID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Person 1 is [relationship] to person 2?' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonFileExtension`
--

CREATE TABLE `gibbonFileExtension` (
  `gibbonFileExtensionID` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `type` enum('Document','Spreadsheet','Presentation','Graphics/Design','Video','Audio','Other') NOT NULL DEFAULT 'Other',
  `extension` varchar(7) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`gibbonFileExtensionID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- Dumping data for table `gibbonFileExtension`
--

INSERT INTO `gibbonFileExtension` (`gibbonFileExtensionID`, `type`, `extension`, `name`) VALUES
(0001, 'Document', 'doc', 'Microsoft Word 97/2000/XP'),
(0002, 'Document', 'docx', 'Microsoft Word 2007+'),
(0003, 'Document', 'pages', 'Apple Pages'),
(0004, 'Document', 'odt', 'OpenOffice Text'),
(0005, 'Document', 'txt', 'Plain Text'),
(0006, 'Document', 'rtf', 'Rich Text Format'),
(0007, 'Spreadsheet', 'xls', 'Microsoft Excel 97/2000/XP'),
(0008, 'Spreadsheet', 'xlsx', 'Microsoft Excel 2007+'),
(0009, 'Spreadsheet', 'ods', 'OpenOffice SpreadSheet'),
(0010, 'Spreadsheet', 'numbers', 'Apple Numbers'),
(0011, 'Spreadsheet', 'csv', 'Comma Seperate Values'),
(0012, 'Presentation', 'ppt', 'Microsoft PowerPoint 97/2000/XP'),
(0013, 'Presentation', 'pptx', 'Microsoft PowerPoint 2007+'),
(0014, 'Presentation', 'key', 'Apple Keynote'),
(0015, 'Audio', 'mp3', 'MPEG Audio'),
(0016, 'Audio', 'mp4', 'MPEG Audio'),
(0017, 'Audio', 'm4a', 'MPEG Audio'),
(0018, 'Audio', 'wma', 'Windows Media Audio'),
(0019, 'Audio', 'ogg', 'Vorbis Ogg'),
(0020, 'Audio', 'aac', 'MPEG Audio'),
(0021, 'Graphics/Design', 'png', 'Portable Network Graphics'),
(0022, 'Graphics/Design', 'jpg', 'Joint Picture Expert Group'),
(0023, 'Graphics/Design', 'gif', 'Graphics Interchange Format'),
(0024, 'Graphics/Design', 'acorn', 'Acorn'),
(0025, 'Graphics/Design', 'ai', 'Adobe Illustrator'),
(0026, 'Graphics/Design', 'psd', 'Adobe Photoshop'),
(0027, 'Graphics/Design', 'svg', 'Scalable Vector Graphics'),
(0028, 'Graphics/Design', 'xcf', 'GIMP eXperimental Computing Facility'),
(0029, 'Video', 'avi', 'Audio Video Interleave'),
(0030, 'Video', 'wmv', 'Windows Media Video'),
(0031, 'Video', 'mpg', 'MPEG Video'),
(0032, 'Video', 'mov', 'QuickTime Movie'),
(0033, 'Video', 'flv', 'Adobe Flash Video'),
(0034, 'Other', 'fla', 'Adobe Flash'),
(0035, 'Video', 'swf', 'Adobe Flash'),
(0036, 'Graphics/Design', 'skp', 'Google SketchUp'),
(0037, 'Document', 'pdf', 'Portable Document Format'),
(0038, 'Graphics/Design', 'jpeg', 'Joint Picture Expert Group'),
(0039, 'Video', 'mpeg', 'MPEG Video'),
(0040, 'Other', 'sb', 'Scratch'),
(0041, 'Video', 'm4v', 'MPG Varient'),
(0042, 'Other', 'zip', 'ZIP Compressed Archive'),
(0043, 'Document', 'htm', 'HyperText Marrkup Language'),
(0044, 'Document', 'html', 'HyperText Marrkup Language'),
(0045, 'Video', '3gp', '3rd Generation Partnership Video');

-- --------------------------------------------------------

--
-- Table structure for table `gibbonHook`
--

CREATE TABLE `gibbonHook` (
  `gibbonHookID` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` enum('Student Profile','Unit') DEFAULT NULL,
  `options` text NOT NULL,
  `gibbonModuleID` int(4) unsigned zerofill NOT NULL COMMENT 'The module which installed this hook.',
  PRIMARY KEY (`gibbonHookID`),
  UNIQUE KEY `name` (`name`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonHouse`
--

CREATE TABLE `gibbonHouse` (
  `gibbonHouseID` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  PRIMARY KEY (`gibbonHouseID`),
  UNIQUE KEY `name` (`name`,`nameShort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonIN`
--

CREATE TABLE `gibbonIN` (
  `gibbonINID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `strategies` text NOT NULL,
  `targets` text NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`gibbonINID`),
  UNIQUE KEY `gibbonPersonID` (`gibbonPersonID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonINDescriptor`
--

CREATE TABLE `gibbonINDescriptor` (
  `gibbonINDescriptorID` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `nameShort` varchar(5) NOT NULL,
  `description` text NOT NULL,
  `sequenceNumber` int(3) NOT NULL,
  PRIMARY KEY (`gibbonINDescriptorID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `gibbonINDescriptor`
--

INSERT INTO `gibbonINDescriptor` (`gibbonINDescriptorID`, `name`, `nameShort`, `description`, `sequenceNumber`) VALUES
(001, 'Special Education Needs', 'SEN', 'Official learning needs that have been professionally identified.', 1),
(002, 'English as an Additional Language', 'EAL', 'Obvious language needs in English acquisition.', 2),
(003, 'Other Needs', 'ON', 'Any other case. E.g. learning issues that have not been assessed, or ongoing home/family issues that should be known to staff and which may relate to teaching and learning.', 3);

-- --------------------------------------------------------

--
-- Table structure for table `gibbonINPersonDescriptor`
--

CREATE TABLE `gibbonINPersonDescriptor` (
  `gibbonINPersonDescriptorID` int(12) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `gibbonINDescriptorID` int(3) unsigned zerofill NOT NULL,
  `gibbonAlertLevelID` int(3) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonINPersonDescriptorID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonLibraryItem`
--

CREATE TABLE `gibbonLibraryItem` (
  `gibbonLibraryItemID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonLibraryTypeID` int(5) unsigned zerofill NOT NULL,
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'Name for book, model for computer, etc.',
  `producer` varchar(255) NOT NULL COMMENT 'Author for book, manufacturer for computer, etc',
  `fields` text NOT NULL,
  `vendor` varchar(100) NOT NULL,
  `purchaseDate` date DEFAULT NULL,
  `invoiceNumber` varchar(50) NOT NULL,
  `imageType` enum('','Link','File') NOT NULL DEFAULT '' COMMENT 'Type of image. Image should be 240px x 240px, or smaller.',
  `imageLocation` varchar(255) NOT NULL COMMENT 'URL or local FS path of image.',
  `comment` text NOT NULL,
  `gibbonSpaceID` int(5) unsigned zerofill DEFAULT NULL,
  `locationDetail` varchar(255) NOT NULL,
  `ownershipType` enum('School','Individual') NOT NULL DEFAULT 'School',
  `gibbonPersonIDOwnership` int(10) unsigned zerofill DEFAULT NULL COMMENT 'If owned by school, then this is the main user. If owned by individual, then this is that individual.',
  `gibbonDepartmentID` int(4) unsigned zerofill DEFAULT NULL COMMENT 'Who is responsible for managing this item? By default this will be the person who added the record, but it can be changed.',
  `borrowable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `status` enum('Available','In Use','Decommissioned','Lost','On Loan','Repair','Reserved') NOT NULL DEFAULT 'Available' COMMENT 'The current status of the item.',
  `gibbonPersonIDStatusResponsible` int(10) unsigned zerofill DEFAULT NULL COMMENT 'The person who is responsible for the current status.',
  `gibbonPersonIDStatusRecorder` int(10) unsigned zerofill DEFAULT NULL COMMENT 'The person who recored the current status.',
  `timestampStatus` datetime DEFAULT NULL COMMENT 'The time the status was recorded',
  `returnExpected` date DEFAULT NULL COMMENT 'The time when the event expires.',
  `returnAction` enum('Make Available','Decommission','Repair','Reserve') DEFAULT NULL COMMENT 'What to do when the item is returned?',
  `gibbonPersonIDReturnAction` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `timestampCreator` datetime NOT NULL,
  `gibbonPersonIDUpdate` int(10) unsigned zerofill DEFAULT NULL,
  `timestampUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`gibbonLibraryItemID`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonLibraryItemEvent`
--

CREATE TABLE `gibbonLibraryItemEvent` (
  `gibbonLibraryItemEventID` int(14) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonLibraryItemID` int(10) unsigned zerofill NOT NULL,
  `type` enum('Decommission','Loss','Loan','Repair','Reserve','Other') NOT NULL DEFAULT 'Other' COMMENT 'This is maintained even after the item is returned, so we know what type of event it was.',
  `status` enum('Available','Decommissioned','Lost','On Loan','Repair','Reserved','Returned') NOT NULL DEFAULT 'Available',
  `gibbonPersonIDStatusResponsible` int(10) unsigned zerofill DEFAULT NULL COMMENT 'The person who was responsible for the event.',
  `gibbonPersonIDOut` int(10) unsigned zerofill DEFAULT NULL COMMENT 'The person who recored the event.',
  `timestampOut` datetime DEFAULT NULL COMMENT 'The time the event was recorded',
  `returnExpected` date DEFAULT NULL COMMENT 'The time when the event expires.',
  `returnAction` enum('Make Available','Decommission','Repair','Reserve') DEFAULT NULL COMMENT 'What to do when the item is returned?',
  `gibbonPersonIDReturnAction` int(10) unsigned zerofill DEFAULT NULL,
  `timestampReturn` datetime DEFAULT NULL,
  `gibbonPersonIDIn` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`gibbonLibraryItemEventID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonLibraryType`
--

CREATE TABLE `gibbonLibraryType` (
  `gibbonLibraryTypeID` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `fields` text NOT NULL,
  PRIMARY KEY (`gibbonLibraryTypeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `gibbonLibraryType`
--

INSERT INTO `gibbonLibraryType` (`gibbonLibraryTypeID`, `name`, `active`, `fields`) VALUES
(00004, 'Print Publication', 'Y', 'a:20:{i:0;a:6:{s:4:"name";s:6:"Format";s:11:"description";s:0:"";s:4:"type";s:6:"Select";s:7:"options";s:341:",Art - Original,Art - Reproduction,Book,Braille,Cartographic material,Chart,Diorama,Electronic Resource,Filmstrip,Flash Card,Game,Globe,Journal,Kit,Large print,Magazine,Manuscript,Microform,Microscope slide,Model,Motion Picture,Music,Picture,Realia,Resource,Serial,Slide,Sound Recording,Technical Drawing,Text,Toy,Transparency,Videorecording";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:1;a:6:{s:4:"name";s:9:"Publisher";s:11:"description";s:45:"Name of the company who published the volume.";s:4:"type";s:4:"Text";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:2;a:6:{s:4:"name";s:16:"Publication Date";s:11:"description";s:36:"Format: dd/mm/yyyy, mm/yyyy or yyyy.";s:4:"type";s:4:"Text";s:7:"options";s:2:"10";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:3;a:6:{s:4:"name";s:22:"Country of Publication";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:4;a:6:{s:4:"name";s:7:"Edition";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:5;a:6:{s:4:"name";s:6:"ISBN10";s:11:"description";s:28:"10-digit unique ISBN number.";s:4:"type";s:4:"Text";s:7:"options";s:2:"10";s:7:"default";s:0:"";s:8:"required";s:1:"Y";}i:6;a:6:{s:4:"name";s:6:"ISBN13";s:11:"description";s:28:"13-digit unique ISBN number.";s:4:"type";s:4:"Text";s:7:"options";s:2:"13";s:7:"default";s:0:"";s:8:"required";s:1:"Y";}i:7;a:6:{s:4:"name";s:11:"Description";s:11:"description";s:36:"A brief blurb describing the volume.";s:4:"type";s:8:"Textarea";s:7:"options";s:2:"10";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:8;a:6:{s:4:"name";s:8:"Subjects";s:11:"description";s:33:"Comma separated list of subjects.";s:4:"type";s:8:"Textarea";s:7:"options";s:1:"2";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:9;a:6:{s:4:"name";s:10:"Collection";s:11:"description";s:0:"";s:4:"type";s:6:"Select";s:7:"options";s:230:",Fiction, Fiction - Best Sellers, Fiction - Classics, Fiction - Mystery, Fiction - Series, Fiction - Young Adult, Nonfiction, Nonfiction - College Prep, Nonfiction - Graphic Novels, Nonfiction - Life Skills, Nonfiction - Reference";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:10;a:6:{s:4:"name";s:14:"Control Number";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:11;a:6:{s:4:"name";s:20:"Cataloging Authority";s:11:"description";s:37:"Issuing authority for Control Number.";s:4:"type";s:4:"Text";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:12;a:6:{s:4:"name";s:21:"Reader Age (Youngest)";s:11:"description";s:50:"Age in years, youngest reading age recommendation.";s:4:"type";s:4:"Text";s:7:"options";s:1:"3";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:13;a:6:{s:4:"name";s:19:"Reader Age (Oldest)";s:11:"description";s:48:"Age in years, oldest reading age recommendation.";s:4:"type";s:4:"Text";s:7:"options";s:1:"3";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:14;a:6:{s:4:"name";s:10:"Page Count";s:11:"description";s:34:"The number of pages in the volume.";s:4:"type";s:4:"Text";s:7:"options";s:1:"4";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:15;a:6:{s:4:"name";s:6:"Height";s:11:"description";s:41:"The physical height of the volume, in cm.";s:4:"type";s:4:"Text";s:7:"options";s:1:"6";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:16;a:6:{s:4:"name";s:5:"Width";s:11:"description";s:40:"The physical width of the volume, in cm.";s:4:"type";s:4:"Text";s:7:"options";s:1:"6";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:17;a:6:{s:4:"name";s:9:"Thickness";s:11:"description";s:44:"The physical thickness of the volume, in cm.";s:4:"type";s:4:"Text";s:7:"options";s:1:"6";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:18;a:6:{s:4:"name";s:8:"Language";s:11:"description";s:35:"The primary language of the volume.";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:19;a:6:{s:4:"name";s:4:"Link";s:11:"description";s:44:"Link to web-based information on the volume.";s:4:"type";s:3:"URL";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}}'),
(00007, 'Computer', 'Y', 'a:14:{i:0;a:6:{s:4:"name";s:11:"Form Factor";s:11:"description";s:0:"";s:4:"type";s:6:"Select";s:7:"options";s:50:"Desktop, Laptop, Tablet, Phone, Set-Top Box, Other";s:7:"default";s:6:"Laptop";s:8:"required";s:1:"Y";}i:1;a:6:{s:4:"name";s:16:"Operating System";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:2;a:6:{s:4:"name";s:13:"Serial Number";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:3;a:6:{s:4:"name";s:10:"Model Name";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:4;a:6:{s:4:"name";s:8:"Model ID";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:5;a:6:{s:4:"name";s:8:"CPU Type";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:6;a:6:{s:4:"name";s:9:"CPU Speed";s:11:"description";s:7:"In GHz.";s:4:"type";s:4:"Text";s:7:"options";s:1:"6";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:7;a:6:{s:4:"name";s:6:"Memory";s:11:"description";s:17:"Total RAM, in GB.";s:4:"type";s:4:"Text";s:7:"options";s:1:"6";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:8;a:6:{s:4:"name";s:7:"Storage";s:11:"description";s:30:"Total HDD/SDD capacity, in GB.";s:4:"type";s:4:"Text";s:7:"options";s:1:"6";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:9;a:6:{s:4:"name";s:11:"Accessories";s:11:"description";s:43:"Any chargers, display dongles, remotes etc?";s:4:"type";s:4:"Text";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:10;a:6:{s:4:"name";s:15:"Warranty Number";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:11;a:6:{s:4:"name";s:15:"Warranty Expiry";s:11:"description";s:19:"Format: dd/mm/yyyy.";s:4:"type";s:4:"Date";s:7:"options";s:0:"";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:12;a:6:{s:4:"name";s:19:"Last Reinstall Date";s:11:"description";s:19:"Format: dd/mm/yyyy.";s:4:"type";s:4:"Date";s:7:"options";s:0:"";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:13;a:6:{s:4:"name";s:16:"Repair Log/Notes";s:11:"description";s:0:"";s:4:"type";s:8:"Textarea";s:7:"options";s:2:"10";s:7:"default";s:0:"";s:8:"required";s:1:"N";}}'),
(00010, 'Electronics', 'Y', 'a:8:{i:0;a:6:{s:4:"name";s:4:"Type";s:11:"description";s:29:"What kind of product is this?";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"Y";}i:1;a:6:{s:4:"name";s:13:"Serial Number";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:2;a:6:{s:4:"name";s:10:"Model Name";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:3;a:6:{s:4:"name";s:8:"Model ID";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:4;a:6:{s:4:"name";s:11:"Accessories";s:11:"description";s:36:"Any chargers, remotes controls, etc?";s:4:"type";s:4:"Text";s:7:"options";s:3:"255";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:5;a:6:{s:4:"name";s:15:"Warranty Number";s:11:"description";s:0:"";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:6;a:6:{s:4:"name";s:15:"Warranty Expiry";s:11:"description";s:19:"Format: dd/mm/yyyy.";s:4:"type";s:4:"Date";s:7:"options";s:0:"";s:7:"default";s:0:"";s:8:"required";s:1:"N";}i:7;a:6:{s:4:"name";s:16:"Repair Log/Notes";s:11:"description";s:0:"";s:4:"type";s:8:"Textarea";s:7:"options";s:2:"10";s:7:"default";s:0:"";s:8:"required";s:1:"N";}}'),
(00011, 'Other', 'Y', 'a:1:{i:0;a:6:{s:4:"name";s:4:"Type";s:11:"description";s:29:"What kind of product is this?";s:4:"type";s:4:"Text";s:7:"options";s:2:"50";s:7:"default";s:0:"";s:8:"required";s:1:"Y";}}');

-- --------------------------------------------------------

--
-- Table structure for table `gibbonMarkbookColumn`
--

CREATE TABLE `gibbonMarkbookColumn` (
  `gibbonMarkbookColumnID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonCourseClassID` int(8) unsigned zerofill NOT NULL,
  `gibbonHookID` int(4) unsigned zerofill DEFAULT NULL,
  `gibbonUnitID` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonPlannerEntryID` int(14) unsigned zerofill DEFAULT NULL,
  `groupingID` int(8) unsigned zerofill DEFAULT NULL COMMENT 'A value used to group multiple markbook columns.',
  `type` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `attainment` enum('Y','N') NOT NULL DEFAULT 'Y',
  `gibbonScaleIDAttainment` int(5) unsigned zerofill NOT NULL,
  `effort` enum('Y','N') NOT NULL DEFAULT 'Y',
  `gibbonScaleIDEffort` int(5) unsigned zerofill NOT NULL,
  `gibbonRubricIDAttainment` int(8) unsigned zerofill DEFAULT NULL,
  `gibbonRubricIDEffort` int(8) unsigned zerofill DEFAULT NULL,
  `comment` enum('Y','N') NOT NULL DEFAULT 'Y',
  `complete` enum('N','Y') NOT NULL,
  `completeDate` date DEFAULT NULL,
  `viewableStudents` enum('N','Y') NOT NULL,
  `viewableParents` enum('N','Y') NOT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonIDLastEdit` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonMarkbookColumnID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonMarkbookEntry`
--

CREATE TABLE `gibbonMarkbookEntry` (
  `gibbonMarkbookEntryID` int(12) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonMarkbookColumnID` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonIDStudent` int(10) unsigned NOT NULL,
  `attainmentValue` varchar(10) NOT NULL,
  `attainmentDescriptor` varchar(20) NOT NULL,
  `attainmentConcern` enum('N','Y') NOT NULL,
  `effortValue` varchar(10) NOT NULL,
  `effortDescriptor` varchar(20) NOT NULL,
  `effortConcern` enum('N','Y') NOT NULL,
  `comment` text NOT NULL,
  `response` varchar(255) DEFAULT NULL,
  `gibbonPersonIDLastEdit` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonMarkbookEntryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonMedicalCondition`
--

CREATE TABLE `gibbonMedicalCondition` (
  `gibbonMedicalConditionID` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`gibbonMedicalConditionID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `gibbonMedicalCondition`
--

INSERT INTO `gibbonMedicalCondition` (`gibbonMedicalConditionID`, `name`) VALUES
(0001, 'Allergy - Food'),
(0002, 'Allergy - Insect'),
(0003, 'Allergy - Drug'),
(0004, 'Allergy - Animal'),
(0005, 'Allergy - Grass/Pollen'),
(0006, 'Allergy - Other'),
(0007, 'Asthma'),
(0008, 'G6PD Deficiency'),
(0009, 'Joint Problems'),
(0010, 'Diabetes'),
(0011, 'Hypertension'),
(0012, 'Convulsions/Epilepsy'),
(0013, 'Kidney Disease'),
(0014, 'Rare Blood Type'),
(0015, 'Heart Condition'),
(0016, 'Previous Concussion or Head Injury'),
(0017, 'Previous Serious Injury'),
(0018, 'Dizziness or Fainting spells'),
(0019, 'Rheumatic Fever'),
(0020, 'Frequent Nose Bleeds'),
(0021, 'Psychological Condition'),
(0022, 'Hearing Impairment'),
(0023, 'Visual Impairment'),
(0024, 'Visual Impairment - Requiring Contact Lenses or Glasses'),
(0025, 'Visual Impairment - Colour Blindness'),
(0026, 'Travel Sickness'),
(0027, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `gibbonMessenger`
--

CREATE TABLE `gibbonMessenger` (
  `gibbonMessengerID` int(12) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `email` enum('N','Y') NOT NULL DEFAULT 'N',
  `messageWall` enum('N','Y') NOT NULL DEFAULT 'N',
  `messageWall_date1` date DEFAULT NULL,
  `messageWall_date2` date DEFAULT NULL,
  `messageWall_date3` date DEFAULT NULL,
  `sms` enum('N','Y') NOT NULL DEFAULT 'N',
  `subject` varchar(30) NOT NULL,
  `body` text NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gibbonMessengerID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonMessengerTarget`
--

CREATE TABLE `gibbonMessengerTarget` (
  `gibbonMessengerTargetID` int(14) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonMessengerID` int(12) unsigned zerofill NOT NULL,
  `type` enum('Class','Course','Roll Group','Year Group','Activity','Role','Applicants','Individuals','Houses') NOT NULL,
  `id` int(12) NOT NULL,
  `parents` enum('N','Y') NOT NULL DEFAULT 'N',
  `students` enum('N','Y') NOT NULL DEFAULT 'N',
  `staff` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`gibbonMessengerTargetID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonModule`
--

CREATE TABLE `gibbonModule` (
  `gibbonModuleID` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'This number is assigned at install, and is only unique to the installation',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT 'This name should be globally unique preferably, but certainly locally unique',
  `description` varchar(100) NOT NULL,
  `entryURL` varchar(255) NOT NULL DEFAULT 'index.php',
  `type` enum('Core','Additional') NOT NULL DEFAULT 'Core',
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `category` varchar(10) NOT NULL,
  `version` varchar(6) NOT NULL,
  `author` varchar(40) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`gibbonModuleID`),
  UNIQUE KEY `gibbonModuleName` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=143 ;

--
-- Dumping data for table `gibbonModule`
--

INSERT INTO `gibbonModule` (`gibbonModuleID`, `name`, `description`, `entryURL`, `type`, `active`, `category`, `version`, `author`, `url`) VALUES
(0001, 'School Admin', 'Allows administrators to configure school settings.', 'schoolYear_manage.php', 'Core', 'Y', 'Admin', '', 'Ross Parker', 'http://rossparker.org'),
(0002, 'User Admin', 'Allows administrators to manage users.', 'user_manage.php', 'Core', 'Y', 'Admin', '', 'Ross Parker', 'http://rossparker.org'),
(0003, 'System Admin', 'Allows administrators to configure system settings.', 'systemSettings.php', 'Core', 'Y', 'Admin', '', 'Ross Parker', 'http://rossparker.org'),
(0005, 'Students', 'Allows users to view student data', 'student_view.php', 'Core', 'Y', 'People', '', 'Ross Parker', 'http://rossparker.org'),
(0006, 'Attendance', 'School attendance taking', 'attendance_take_byRollGroup.php', 'Core', 'Y', 'People', '', 'Ross Parker', 'http://rossparker.org'),
(0007, 'Markbook', 'A system for keeping track of marks', 'markbook_view.php', 'Core', 'Y', 'ARR', '', 'Ross Parker', 'http://rossparker.org'),
(0004, 'Departments', 'View details within a department', 'departments.php', 'Core', 'Y', 'T&L', '', 'Ross Parker', 'http://rossparker.org'),
(0009, 'Planner', 'Supports lesson planning and information sharing for staff, student and parents', 'planner.php', 'Core', 'Y', 'T&L', '', 'Ross Parker', 'http://rossparker.org'),
(0011, 'Individual Needs', 'Individual Needs', 'in_view.php', 'Core', 'Y', 'T&L', '', 'Ross Parker', 'http://rossparker.org'),
(0012, 'Crowd Assessment', 'Allows users to assess each other''s work', 'crowdAssess.php', 'Core', 'Y', 'ARR', '', 'Ross Parker', 'http://rossparker.org'),
(0013, 'Timetable Admin', 'Timetable administration', 'tt.php', 'Core', 'Y', 'Admin', '', 'Ross Parker', 'http://rossparker.org'),
(0014, 'Timetable', 'Allows users to view timetables', 'tt.php', 'Core', 'Y', 'T&L', '', 'Ross Parker', 'http://rossparker.org'),
(0015, 'Activities', 'Run a school activities program', 'activities_view.php', 'Core', 'Y', 'T&L', '', 'Ross Parker', 'http://rossparker.org'),
(0008, 'Data Updater', 'Allow users to update their family''s data', 'data_personal.php', 'Core', 'Y', 'People', '', 'Ross Parker', 'http://rossparker.org'),
(0016, 'External Assessment', 'Facilitates tracking of student performance in external examinations.', 'externalAssessment.php', 'Core', 'Y', 'ARR', '', 'Ross Parker', 'http://rossparker.org'),
(0017, 'Application Form', 'Allows users, with or without an account, to apply for student places.', 'applicationForm.php', 'Core', 'Y', 'People', '', 'Ross Parker', 'http://rossparker.org'),
(0119, 'Behaviour', 'Tracking Student Behaviour', 'behaviour_manage.php', 'Core', 'Y', 'People', '', 'Ross Parker', 'http://rossparker.org'),
(0120, 'Resources', 'Collect and manage resources for teaching and learning', 'resources_view.php', 'Core', 'Y', 'T&L', '', 'Ross Parker', 'http://rossparker.org'),
(0121, 'Messenger', 'Unified messenger for email, message wall and more.', 'messenger_manage.php', 'Core', 'Y', 'Other', '', 'Ross Parker', 'http://rossparker.org'),
(0132, 'Library', 'Allows the management of a catalog from which items can be borrowed.', 'library_manage_catalog.php', 'Core', 'Y', 'T&L', '', 'Ross Parker', 'http://rossparker.org'),
(0126, 'Rubrics', 'Allows users to create rubrics for assessment', 'rubrics.php', 'Core', 'Y', 'ARR', '', 'Ross Parker', 'http://rossparker.org');

-- --------------------------------------------------------

--
-- Table structure for table `gibbonOutcome`
--

CREATE TABLE `gibbonOutcome` (
  `gibbonOutcomeID` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `nameShort` varchar(14) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `active` enum('Y','N') NOT NULL,
  `scope` enum('School','Learning Area') NOT NULL,
  `gibbonDepartmentID` int(4) unsigned zerofill DEFAULT NULL,
  `gibbonYearGroupIDList` varchar(255) NOT NULL,
  `gibbonPersonIDCreator` int(8) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonOutcomeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonPermission`
--

CREATE TABLE `gibbonPermission` (
  `permissionID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonRoleID` int(3) unsigned zerofill NOT NULL,
  `gibbonActionID` int(7) unsigned zerofill NOT NULL,
  PRIMARY KEY (`permissionID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42170 ;

--
-- Dumping data for table `gibbonPermission`
--

INSERT INTO `gibbonPermission` (`permissionID`, `gibbonRoleID`, `gibbonActionID`) VALUES
(0000041914, 001, 0000705),
(0000041915, 002, 0000705),
(0000041916, 001, 0000718),
(0000041917, 001, 0000673),
(0000041918, 006, 0000673),
(0000041919, 002, 0000673),
(0000041920, 001, 0000067),
(0000041921, 006, 0000067),
(0000041922, 002, 0000067),
(0000041923, 001, 0000058),
(0000041924, 006, 0000058),
(0000041925, 002, 0000058),
(0000041926, 001, 0000055),
(0000041927, 001, 0000056),
(0000041928, 003, 0000056),
(0000041929, 002, 0000056),
(0000041930, 001, 0000057),
(0000041931, 006, 0000057),
(0000041932, 002, 0000057),
(0000041933, 001, 0000059),
(0000041934, 006, 0000059),
(0000041935, 002, 0000059),
(0000041936, 003, 0000053),
(0000041937, 004, 0000738),
(0000041938, 001, 0000052),
(0000041939, 004, 0000052),
(0000041940, 006, 0000052),
(0000041941, 002, 0000052),
(0000041942, 001, 0000074),
(0000041943, 004, 0000074),
(0000041944, 006, 0000074),
(0000041945, 002, 0000074),
(0000041946, 001, 0000026),
(0000041947, 006, 0000026),
(0000041948, 002, 0000026),
(0000041949, 001, 0000027),
(0000041950, 006, 0000027),
(0000041951, 002, 0000027),
(0000041952, 001, 0000030),
(0000041953, 006, 0000030),
(0000041954, 002, 0000030),
(0000041955, 001, 0000028),
(0000041956, 006, 0000028),
(0000041957, 002, 0000028),
(0000041958, 001, 0000031),
(0000041959, 006, 0000031),
(0000041960, 002, 0000031),
(0000041961, 004, 0000060),
(0000041962, 001, 0000044),
(0000041963, 006, 0000044),
(0000041964, 002, 0000044),
(0000041965, 001, 0000029),
(0000041966, 006, 0000029),
(0000041967, 002, 0000029),
(0000041968, 001, 0000729),
(0000041969, 001, 0000606),
(0000041970, 002, 0000607),
(0000041971, 001, 0000608),
(0000041972, 002, 0000608),
(0000041973, 001, 0000047),
(0000041974, 004, 0000047),
(0000041975, 003, 0000047),
(0000041976, 002, 0000047),
(0000041977, 001, 0000586),
(0000041978, 004, 0000064),
(0000041979, 001, 0000585),
(0000041980, 004, 0000014),
(0000041981, 001, 0000022),
(0000041982, 004, 0000022),
(0000041983, 003, 0000022),
(0000041984, 006, 0000022),
(0000041985, 002, 0000022),
(0000041986, 001, 0000069),
(0000041987, 001, 0000068),
(0000041988, 002, 0000068),
(0000041989, 001, 0000724),
(0000041990, 002, 0000724),
(0000041991, 001, 0000046),
(0000041992, 001, 0000727),
(0000041993, 001, 0000730),
(0000041994, 004, 0000730),
(0000041995, 003, 0000730),
(0000041996, 002, 0000730),
(0000041997, 001, 0000747),
(0000041998, 001, 0000719),
(0000041999, 001, 0000717),
(0000042000, 001, 0000732),
(0000042001, 002, 0000732),
(0000042002, 001, 0000731),
(0000042003, 001, 0000789),
(0000042004, 002, 0000788),
(0000042005, 001, 0000034),
(0000042006, 002, 0000034),
(0000042007, 004, 0000041),
(0000042008, 001, 0000033),
(0000042009, 006, 0000033),
(0000042010, 002, 0000033),
(0000042011, 003, 0000039),
(0000042012, 001, 0000630),
(0000042013, 002, 0000629),
(0000042014, 001, 0000624),
(0000042015, 001, 0000623),
(0000042016, 002, 0000623),
(0000042017, 001, 0000625),
(0000042018, 002, 0000625),
(0000042019, 001, 0000657),
(0000042020, 001, 0000742),
(0000042021, 002, 0000742),
(0000042022, 001, 0000743),
(0000042023, 002, 0000743),
(0000042024, 001, 0000744),
(0000042025, 001, 0000615),
(0000042026, 001, 0000614),
(0000042027, 002, 0000614),
(0000042028, 001, 0000616),
(0000042029, 002, 0000616),
(0000042030, 001, 0000618),
(0000042031, 001, 0000617),
(0000042032, 002, 0000617),
(0000042033, 001, 0000619),
(0000042034, 002, 0000619),
(0000042035, 001, 0000632),
(0000042036, 001, 0000660),
(0000042037, 002, 0000660),
(0000042038, 001, 0000658),
(0000042039, 002, 0000658),
(0000042040, 001, 0000628),
(0000042041, 001, 0000621),
(0000042042, 001, 0000620),
(0000042043, 002, 0000620),
(0000042044, 001, 0000622),
(0000042045, 002, 0000622),
(0000042046, 001, 0000626),
(0000042047, 002, 0000626),
(0000042048, 001, 0000627),
(0000042049, 001, 0000745),
(0000042050, 004, 0000745),
(0000042051, 003, 0000745),
(0000042052, 002, 0000745),
(0000042053, 002, 0000036),
(0000042054, 001, 0000038),
(0000042055, 004, 0000040),
(0000042056, 003, 0000035),
(0000042057, 002, 0000675),
(0000042058, 001, 0000676),
(0000042059, 001, 0000661),
(0000042060, 002, 0000662),
(0000042061, 001, 0000071),
(0000042062, 002, 0000071),
(0000042063, 001, 0000061),
(0000042064, 002, 0000061),
(0000042065, 001, 0000611),
(0000042066, 006, 0000612),
(0000042067, 002, 0000612),
(0000042068, 001, 0000613),
(0000042069, 006, 0000613),
(0000042070, 002, 0000613),
(0000042071, 002, 0000678),
(0000042072, 001, 0000679),
(0000042073, 001, 0000708),
(0000042074, 004, 0000708),
(0000042075, 003, 0000708),
(0000042076, 002, 0000708),
(0000042077, 001, 0000736),
(0000042078, 001, 0000054),
(0000042079, 001, 0000723),
(0000042080, 001, 0000605),
(0000042081, 001, 0000013),
(0000042082, 001, 0000062),
(0000042083, 001, 0000782),
(0000042084, 001, 0000706),
(0000042085, 001, 0000008),
(0000042086, 001, 0000726),
(0000042087, 001, 0000720),
(0000042088, 001, 0000674),
(0000042089, 001, 0000610),
(0000042090, 001, 0000007),
(0000042091, 001, 0000003),
(0000042092, 001, 0000746),
(0000042093, 001, 0000025),
(0000042094, 001, 0000016),
(0000042095, 001, 0000740),
(0000042096, 001, 0000015),
(0000042097, 001, 0000006),
(0000042098, 001, 0000737),
(0000042099, 001, 0000721),
(0000042100, 001, 0000077),
(0000042101, 006, 0000077),
(0000042102, 002, 0000077),
(0000042103, 001, 0000609),
(0000042104, 001, 0000011),
(0000042105, 006, 0000011),
(0000042106, 001, 0000734),
(0000042107, 001, 0000756),
(0000042108, 001, 0000075),
(0000042109, 006, 0000075),
(0000042110, 002, 0000075),
(0000042111, 001, 0000707),
(0000042112, 002, 0000707),
(0000042113, 001, 0000722),
(0000042114, 001, 0000073),
(0000042115, 006, 0000073),
(0000042116, 002, 0000073),
(0000042117, 001, 0000787),
(0000042118, 001, 0000072),
(0000042119, 006, 0000072),
(0000042120, 002, 0000072),
(0000042121, 001, 0000043),
(0000042122, 006, 0000043),
(0000042123, 002, 0000043),
(0000042124, 003, 0000023),
(0000042125, 001, 0000024),
(0000042126, 006, 0000024),
(0000042127, 002, 0000024),
(0000042128, 004, 0000042),
(0000042129, 001, 0000010),
(0000042130, 001, 0000020),
(0000042131, 001, 0000005),
(0000042132, 001, 0000631),
(0000042133, 001, 0000051),
(0000042134, 004, 0000051),
(0000042135, 003, 0000051),
(0000042136, 006, 0000051),
(0000042137, 002, 0000051),
(0000042138, 001, 0000655),
(0000042139, 006, 0000655),
(0000042140, 002, 0000655),
(0000042141, 001, 0000066),
(0000042142, 001, 0000018),
(0000042143, 001, 0000656),
(0000042144, 001, 0000049),
(0000042145, 001, 0000017),
(0000042146, 001, 0000048),
(0000042147, 001, 0000050),
(0000042148, 001, 0000001),
(0000042149, 001, 0000735),
(0000042150, 001, 0000078),
(0000042151, 001, 0000019),
(0000042152, 001, 0000021),
(0000042153, 001, 0000012),
(0000042154, 001, 0000009),
(0000042155, 001, 0000032),
(0000042156, 001, 0000733),
(0000042157, 001, 0000002),
(0000042158, 001, 0000065),
(0000042159, 001, 0000063),
(0000042160, 001, 0000070),
(0000042161, 001, 0000004),
(0000042169, 001, 0000794);

-- --------------------------------------------------------

--
-- Table structure for table `gibbonPerson`
--

CREATE TABLE `gibbonPerson` (
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `title` varchar(5) NOT NULL,
  `surname` varchar(30) NOT NULL DEFAULT '',
  `firstName` varchar(30) NOT NULL DEFAULT '',
  `otherNames` varchar(30) NOT NULL DEFAULT '',
  `preferredName` varchar(30) NOT NULL DEFAULT '',
  `officialName` varchar(150) NOT NULL,
  `nameInCharacters` varchar(20) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `passwordStrong` varchar(255) NOT NULL,
  `passwordStrongSalt` varchar(255) NOT NULL,
  `passwordForceReset` enum('N','Y') NOT NULL DEFAULT 'N' COMMENT 'Force user to reset password on next login.',
  `status` enum('Full','Expected','Left') NOT NULL DEFAULT 'Full',
  `canLogin` enum('Y','N') NOT NULL DEFAULT 'Y',
  `gibbonRoleIDPrimary` int(3) unsigned zerofill NOT NULL,
  `gibbonRoleIDAll` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `emailAlternate` varchar(50) NOT NULL,
  `image_240` varchar(255) DEFAULT NULL,
  `image_75` varchar(255) DEFAULT NULL,
  `lastIPAddress` varchar(15) NOT NULL DEFAULT '',
  `lastTimestamp` timestamp NULL DEFAULT NULL,
  `lastFailIPAddress` varchar(15) DEFAULT NULL,
  `lastFailTimestamp` timestamp NULL DEFAULT NULL,
  `failCount` int(1) DEFAULT '0',
  `address1` mediumtext NOT NULL,
  `address1District` varchar(255) NOT NULL,
  `address1Country` varchar(255) NOT NULL,
  `address2` mediumtext NOT NULL,
  `address2District` varchar(255) NOT NULL,
  `address2Country` varchar(255) NOT NULL,
  `phone1Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone1CountryCode` varchar(7) NOT NULL,
  `phone1` varchar(20) NOT NULL,
  `phone3Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone3CountryCode` varchar(7) NOT NULL,
  `phone3` varchar(20) NOT NULL,
  `phone2Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone2CountryCode` varchar(7) NOT NULL,
  `phone2` varchar(20) NOT NULL,
  `phone4Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone4CountryCode` varchar(7) NOT NULL,
  `phone4` varchar(20) NOT NULL,
  `website` varchar(255) NOT NULL,
  `languageFirst` varchar(30) NOT NULL,
  `languageSecond` varchar(30) NOT NULL,
  `languageThird` varchar(30) NOT NULL,
  `countryOfBirth` varchar(30) NOT NULL,
  `ethnicity` varchar(40) NOT NULL,
  `citizenship1` varchar(255) NOT NULL,
  `citizenship1Passport` varchar(30) NOT NULL,
  `citizenship2` varchar(255) NOT NULL,
  `citizenship2Passport` varchar(30) NOT NULL,
  `religion` varchar(30) NOT NULL,
  `nationalIDCardNumber` varchar(30) NOT NULL,
  `residencyStatus` varchar(255) NOT NULL,
  `visaExpiryDate` date DEFAULT NULL,
  `profession` varchar(30) NOT NULL,
  `employer` varchar(30) NOT NULL,
  `jobTitle` varchar(30) NOT NULL,
  `emergency1Name` varchar(30) NOT NULL,
  `emergency1Number1` varchar(30) NOT NULL,
  `emergency1Number2` varchar(30) NOT NULL,
  `emergency1Relationship` varchar(30) NOT NULL,
  `emergency2Name` varchar(30) NOT NULL,
  `emergency2Number1` varchar(30) NOT NULL,
  `emergency2Number2` varchar(30) NOT NULL,
  `emergency2Relationship` varchar(30) NOT NULL,
  `gibbonHouseID` int(3) unsigned zerofill DEFAULT NULL,
  `studentID` varchar(10) NOT NULL,
  `dateStart` date DEFAULT NULL,
  `dateEnd` date DEFAULT NULL,
  `gibbonSchoolYearIDClassOf` int(3) unsigned zerofill DEFAULT NULL,
  `lastSchool` varchar(100) NOT NULL,
  `nextSchool` varchar(100) NOT NULL,
  `departureReason` varchar(50) NOT NULL,
  `transport` varchar(255) NOT NULL,
  `calendarFeedPersonal` text NOT NULL,
  `viewCalendarSchool` enum('Y','N') NOT NULL DEFAULT 'Y',
  `viewCalendarPersonal` enum('Y','N') NOT NULL DEFAULT 'Y',
  `gibbonApplicationFormID` int(12) unsigned zerofill DEFAULT NULL,
  `lockerNumber` varchar(20) NOT NULL,
  `vehicleRegistration` varchar(20) NOT NULL,
  `personalBackground` varchar(255) NOT NULL,
  `messengerLastBubble` date DEFAULT NULL,
  PRIMARY KEY (`gibbonPersonID`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=910 ;

--
-- Dumping data for table `gibbonPerson`
--

INSERT INTO `gibbonPerson` (`gibbonPersonID`, `title`, `surname`, `firstName`, `otherNames`, `preferredName`, `officialName`, `nameInCharacters`, `gender`, `username`, `password`, `passwordStrong`, `passwordStrongSalt`, `passwordForceReset`, `status`, `canLogin`, `gibbonRoleIDPrimary`, `gibbonRoleIDAll`, `dob`, `email`, `emailAlternate`, `image_240`, `image_75`, `lastIPAddress`, `lastTimestamp`, `lastFailIPAddress`, `lastFailTimestamp`, `failCount`, `address1`, `address1District`, `address1Country`, `address2`, `address2District`, `address2Country`, `phone1Type`, `phone1CountryCode`, `phone1`, `phone3Type`, `phone3CountryCode`, `phone3`, `phone2Type`, `phone2CountryCode`, `phone2`, `phone4Type`, `phone4CountryCode`, `phone4`, `website`, `languageFirst`, `languageSecond`, `languageThird`, `countryOfBirth`, `ethnicity`, `citizenship1`, `citizenship1Passport`, `citizenship2`, `citizenship2Passport`, `religion`, `nationalIDCardNumber`, `residencyStatus`, `visaExpiryDate`, `profession`, `employer`, `jobTitle`, `emergency1Name`, `emergency1Number1`, `emergency1Number2`, `emergency1Relationship`, `emergency2Name`, `emergency2Number1`, `emergency2Number2`, `emergency2Relationship`, `gibbonHouseID`, `studentID`, `dateStart`, `dateEnd`, `gibbonSchoolYearIDClassOf`, `lastSchool`, `nextSchool`, `departureReason`, `transport`, `calendarFeedPersonal`, `viewCalendarSchool`, `viewCalendarPersonal`, `gibbonApplicationFormID`, `lockerNumber`, `vehicleRegistration`, `personalBackground`, `messengerLastBubble`) VALUES
(0000000001, 'Mr. ', 'Administrator', 'System', '', 'System', 'System Administrator', '', 'M', 'admin', '', 'c2a8aa11c285db77dd771eb67a2f8f7c42fff4e55e22e2b0282936f86b31b7f7', '.bDfFgGiJmnOrsSwWXY149', 'N', 'Full', 'Y', 001, '001,002,004', NULL, '', '', '', '', '', '0000-00-00 00:00:00', '::1', '2013-05-14 00:18:24', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, NULL, NULL, '', '', '', '', '', 'N', 'N', NULL, '', '', '', '2013-06-25');

-- --------------------------------------------------------

--
-- Table structure for table `gibbonPersonMedical`
--

CREATE TABLE `gibbonPersonMedical` (
  `gibbonPersonMedicalID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `bloodType` enum('','O+','A+','B+','AB+','O-','A-','B-','AB-') NOT NULL,
  `longTermMedication` enum('','Y','N') NOT NULL,
  `longTermMedicationDetails` text NOT NULL,
  `tetanusWithin10Years` enum('','Y','N') NOT NULL,
  PRIMARY KEY (`gibbonPersonMedicalID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonPersonMedicalCondition`
--

CREATE TABLE `gibbonPersonMedicalCondition` (
  `gibbonPersonMedicalConditionID` int(12) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonPersonMedicalID` int(10) unsigned zerofill NOT NULL,
  `name` varchar(100) NOT NULL,
  `gibbonAlertLevelID` int(3) unsigned zerofill NOT NULL,
  `triggers` varchar(255) NOT NULL,
  `reaction` varchar(255) NOT NULL,
  `response` varchar(255) NOT NULL,
  `medication` varchar(255) NOT NULL,
  `lastEpisode` date DEFAULT NULL,
  `lastEpisodeTreatment` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`gibbonPersonMedicalConditionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonPersonMedicalConditionUpdate`
--

CREATE TABLE `gibbonPersonMedicalConditionUpdate` (
  `gibbonPersonMedicalConditionUpdateID` int(14) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonPersonMedicalUpdateID` int(12) unsigned zerofill DEFAULT NULL,
  `gibbonPersonMedicalConditionID` int(12) unsigned zerofill DEFAULT NULL,
  `gibbonPersonMedicalID` int(10) unsigned zerofill DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `gibbonAlertLevelID` int(3) unsigned zerofill NOT NULL,
  `triggers` varchar(255) NOT NULL,
  `reaction` varchar(255) NOT NULL,
  `response` varchar(255) NOT NULL,
  `medication` varchar(255) NOT NULL,
  `lastEpisode` date DEFAULT NULL,
  `lastEpisodeTreatment` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `gibbonPersonIDUpdater` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonPersonMedicalConditionUpdateID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonPersonMedicalUpdate`
--

CREATE TABLE `gibbonPersonMedicalUpdate` (
  `gibbonPersonMedicalUpdateID` int(12) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `status` enum('Pending','Complete') NOT NULL DEFAULT 'Pending',
  `gibbonPersonMedicalID` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `bloodType` enum('','O+','A+','B+','AB+','O-','A-','B-','AB-') NOT NULL,
  `longTermMedication` enum('','Y','N') NOT NULL,
  `longTermMedicationDetails` text NOT NULL,
  `tetanusWithin10Years` enum('','Y','N') NOT NULL,
  `gibbonPersonIDUpdater` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonPersonMedicalUpdateID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonPersonPayment`
--

CREATE TABLE `gibbonPersonPayment` (
  `gibbonPersonPaymentID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `invoiceTo` enum('Family','Company') NOT NULL,
  `companyName` varchar(100) DEFAULT NULL,
  `companyContact` varchar(100) DEFAULT NULL,
  `companyAddress` varchar(255) DEFAULT NULL,
  `companyEmail` varchar(255) DEFAULT NULL,
  `companyPhone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`gibbonPersonPaymentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonPersonUpdate`
--

CREATE TABLE `gibbonPersonUpdate` (
  `gibbonPersonUpdateID` int(12) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `status` enum('Pending','Complete') NOT NULL DEFAULT 'Pending',
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `title` varchar(5) NOT NULL,
  `surname` varchar(30) NOT NULL DEFAULT '',
  `firstName` varchar(30) NOT NULL DEFAULT '',
  `otherNames` varchar(30) NOT NULL DEFAULT '',
  `preferredName` varchar(30) NOT NULL DEFAULT '',
  `officialName` varchar(150) NOT NULL,
  `nameInCharacters` varchar(20) NOT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `emailAlternate` varchar(50) NOT NULL,
  `address1` mediumtext NOT NULL,
  `address1District` varchar(255) NOT NULL,
  `address1Country` varchar(255) NOT NULL,
  `address2` mediumtext NOT NULL,
  `address2District` varchar(255) NOT NULL,
  `address2Country` varchar(255) NOT NULL,
  `phone1Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone1CountryCode` varchar(7) NOT NULL,
  `phone1` varchar(20) NOT NULL,
  `phone3Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone3CountryCode` varchar(7) NOT NULL,
  `phone3` varchar(20) NOT NULL,
  `phone2Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone2CountryCode` varchar(7) NOT NULL,
  `phone2` varchar(20) NOT NULL,
  `phone4Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone4CountryCode` varchar(7) NOT NULL,
  `phone4` varchar(20) NOT NULL,
  `languageFirst` varchar(30) NOT NULL,
  `languageSecond` varchar(30) NOT NULL,
  `languageThird` varchar(30) NOT NULL,
  `countryOfBirth` varchar(30) NOT NULL,
  `ethnicity` varchar(40) NOT NULL,
  `citizenship1` varchar(255) NOT NULL,
  `citizenship1Passport` varchar(30) NOT NULL,
  `citizenship2` varchar(255) NOT NULL,
  `citizenship2Passport` varchar(30) NOT NULL,
  `religion` varchar(30) NOT NULL,
  `nationalIDCardCountry` varchar(30) NOT NULL,
  `nationalIDCardNumber` varchar(30) NOT NULL,
  `residencyStatus` varchar(255) NOT NULL,
  `visaExpiryDate` date DEFAULT NULL,
  `profession` varchar(30) NOT NULL,
  `employer` varchar(30) NOT NULL,
  `jobTitle` varchar(30) NOT NULL,
  `emergency1Name` varchar(30) NOT NULL,
  `emergency1Number1` varchar(30) NOT NULL,
  `emergency1Number2` varchar(30) NOT NULL,
  `emergency1Relationship` varchar(30) NOT NULL,
  `emergency2Name` varchar(30) NOT NULL,
  `emergency2Number1` varchar(30) NOT NULL,
  `emergency2Number2` varchar(30) NOT NULL,
  `emergency2Relationship` varchar(30) NOT NULL,
  `vehicleRegistration` varchar(20) NOT NULL,
  `gibbonPersonIDUpdater` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonPersonUpdateID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonPlannerEntry`
--

CREATE TABLE `gibbonPlannerEntry` (
  `gibbonPlannerEntryID` int(14) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonCourseClassID` int(8) unsigned zerofill NOT NULL,
  `gibbonHookID` int(4) unsigned zerofill DEFAULT NULL,
  `gibbonUnitID` int(10) unsigned zerofill DEFAULT NULL,
  `date` date DEFAULT NULL,
  `timeStart` time DEFAULT NULL,
  `timeEnd` time DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `teachersNotes` mediumtext NOT NULL,
  `homework` enum('N','Y') NOT NULL DEFAULT 'N',
  `homeworkDueDateTime` datetime DEFAULT NULL,
  `homeworkDetails` mediumtext NOT NULL,
  `homeworkSubmission` enum('N','Y') NOT NULL,
  `homeworkSubmissionDateOpen` date DEFAULT NULL,
  `homeworkSubmissionDrafts` varchar(1) DEFAULT NULL,
  `homeworkSubmissionType` enum('','Link','File','Link/File') NOT NULL,
  `homeworkSubmissionRequired` enum('Optional','Compulsory') DEFAULT 'Optional',
  `homeworkCrowdAssess` enum('N','Y') NOT NULL,
  `homeworkCrowdAssessOtherTeachersRead` enum('N','Y') NOT NULL,
  `homeworkCrowdAssessOtherParentsRead` enum('N','Y') NOT NULL,
  `homeworkCrowdAssessClassmatesParentsRead` enum('N','Y') NOT NULL,
  `homeworkCrowdAssessSubmitterParentsRead` enum('N','Y') NOT NULL,
  `homeworkCrowdAssessOtherStudentsRead` enum('N','Y') NOT NULL,
  `homeworkCrowdAssessClassmatesRead` enum('N','Y') NOT NULL,
  `viewableStudents` enum('Y','N') NOT NULL DEFAULT 'Y',
  `viewableParents` enum('Y','N') NOT NULL DEFAULT 'N',
  `twitterSearch` varchar(255) NOT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonIDLastEdit` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonPlannerEntryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonPlannerEntryAttendance`
--

CREATE TABLE `gibbonPlannerEntryAttendance` (
  `gibbonPlannerEntryAttendanceID` int(16) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonPlannerEntryID` int(14) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `type` enum('Present','Present - Late','Absent','Left','Left - Early') NOT NULL,
  `gibbonPersonIDTaker` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonPlannerEntryAttendanceID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonPlannerEntryAttendanceLog`
--

CREATE TABLE `gibbonPlannerEntryAttendanceLog` (
  `gibbonPlannerEntryAttendanceLogID` int(16) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonPlannerEntryID` int(14) unsigned zerofill NOT NULL,
  `gibbonPersonIDTaker` int(10) unsigned zerofill NOT NULL,
  `timestampTaken` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonPlannerEntryAttendanceLogID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonPlannerEntryDiscuss`
--

CREATE TABLE `gibbonPlannerEntryDiscuss` (
  `gibbonPlannerEntryDiscussID` int(16) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonPlannerEntryID` int(14) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` text NOT NULL,
  `gibbonPlannerEntryDiscussIDReplyTo` int(16) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`gibbonPlannerEntryDiscussID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonPlannerEntryGuest`
--

CREATE TABLE `gibbonPlannerEntryGuest` (
  `gibbonPlannerEntryGuestID` int(16) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonPlannerEntryID` int(14) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `role` enum('Guest Student','Guest Teacher','Guest Assistant','Guest Technician','Guest Parent','Other Guest') NOT NULL,
  PRIMARY KEY (`gibbonPlannerEntryGuestID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonPlannerEntryHomework`
--

CREATE TABLE `gibbonPlannerEntryHomework` (
  `gibbonPlannerEntryHomeworkID` int(16) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonPlannerEntryID` int(14) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `type` enum('Link','File') NOT NULL,
  `version` enum('Draft','Final') NOT NULL,
  `status` enum('On Time','Late','Exemption') NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `count` int(1) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonPlannerEntryHomeworkID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonPlannerEntryLike`
--

CREATE TABLE `gibbonPlannerEntryLike` (
  `gibbonPlannerEntryLikeID` int(16) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonPlannerEntryID` int(14) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gibbonPlannerEntryLikeID`),
  UNIQUE KEY `gibbonPlannerEntryID` (`gibbonPlannerEntryID`,`gibbonPersonID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonPlannerEntryOutcome`
--

CREATE TABLE `gibbonPlannerEntryOutcome` (
  `gibbonPlannerEntryOutcomeID` int(16) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonPlannerEntryID` int(14) unsigned zerofill NOT NULL,
  `gibbonOutcomeID` int(8) unsigned zerofill NOT NULL,
  `sequenceNumber` int(4) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`gibbonPlannerEntryOutcomeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonPlannerEntryStudentTracker`
--

CREATE TABLE `gibbonPlannerEntryStudentTracker` (
  `gibbonPlannerEntryStudentTrackerID` int(16) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonPlannerEntryID` int(14) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `homeworkComplete` enum('Y','N') NOT NULL,
  PRIMARY KEY (`gibbonPlannerEntryStudentTrackerID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonResource`
--

CREATE TABLE `gibbonResource` (
  `gibbonResourceID` int(14) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `description` text NOT NULL,
  `gibbonYearGroupIDList` varchar(255) NOT NULL,
  `type` enum('File','HTML','Link') NOT NULL,
  `category` varchar(255) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `tags` text NOT NULL,
  `content` text NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gibbonResourceID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonResourceTag`
--

CREATE TABLE `gibbonResourceTag` (
  `gibbonResourceTagID` int(12) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `tag` varchar(100) NOT NULL,
  `count` int(6) NOT NULL,
  PRIMARY KEY (`gibbonResourceTagID`),
  UNIQUE KEY `tag` (`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonRole`
--

CREATE TABLE `gibbonRole` (
  `gibbonRoleID` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `category` enum('Staff','Student','Parent','Other') NOT NULL DEFAULT 'Staff',
  `name` varchar(20) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `description` varchar(60) NOT NULL,
  `type` enum('Core','Additional') NOT NULL DEFAULT 'Core',
  PRIMARY KEY (`gibbonRoleID`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `nameShort` (`nameShort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `gibbonRole`
--

INSERT INTO `gibbonRole` (`gibbonRoleID`, `category`, `name`, `nameShort`, `description`, `type`) VALUES
(001, 'Staff', 'Administrator', 'Admn', 'Controls all aspects of the system', 'Core'),
(002, 'Staff', 'Teacher', 'Tchr', 'Regular, classroom teacher', 'Core'),
(003, 'Student', 'Student', 'Stud', 'Person studying in the school', 'Core'),
(004, 'Parent', 'Parent', 'Prnt', 'Parent or guardian of person studying in', 'Core'),
(006, 'Staff', 'Support Staff', 'SuSt', 'Staff who support teaching and learning', 'Core');

-- --------------------------------------------------------

--
-- Table structure for table `gibbonRollGroup`
--

CREATE TABLE `gibbonRollGroup` (
  `gibbonRollGroupID` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `name` varchar(10) NOT NULL,
  `nameShort` varchar(5) NOT NULL,
  `gibbonPersonIDTutor` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonPersonIDTutor2` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonPersonIDTutor3` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonRollGroupIDNext` int(5) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`gibbonRollGroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonRubric`
--

CREATE TABLE `gibbonRubric` (
  `gibbonRubricID` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `active` enum('Y','N') NOT NULL,
  `scope` enum('School','Learning Area') NOT NULL,
  `gibbonDepartmentID` int(4) unsigned zerofill DEFAULT NULL,
  `gibbonYearGroupIDList` varchar(255) NOT NULL,
  `gibbonScaleID` int(5) unsigned zerofill DEFAULT NULL,
  `gibbonPersonIDCreator` int(8) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonRubricID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonRubricCell`
--

CREATE TABLE `gibbonRubricCell` (
  `gibbonRubricCellID` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonRubricID` int(8) unsigned zerofill NOT NULL,
  `gibbonRubricColumnID` int(9) unsigned zerofill NOT NULL,
  `gibbonRubricRowID` int(9) unsigned zerofill NOT NULL,
  `contents` text NOT NULL,
  PRIMARY KEY (`gibbonRubricCellID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonRubricColumn`
--

CREATE TABLE `gibbonRubricColumn` (
  `gibbonRubricColumnID` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonRubricID` int(8) unsigned zerofill NOT NULL,
  `title` varchar(20) NOT NULL,
  `sequenceNumber` int(2) NOT NULL,
  `gibbonScaleGradeID` int(7) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`gibbonRubricColumnID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonRubricEntry`
--

CREATE TABLE `gibbonRubricEntry` (
  `gibbonRubricEntry` int(14) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonRubricID` int(8) unsigned NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `gibbonRubricCellID` int(11) unsigned zerofill NOT NULL,
  `contextDBTable` varchar(255) NOT NULL COMMENT 'Which database table is this entry related to?',
  `contextDBTableID` int(20) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonRubricEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonRubricRow`
--

CREATE TABLE `gibbonRubricRow` (
  `gibbonRubricRowID` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonRubricID` int(8) unsigned zerofill NOT NULL,
  `title` varchar(40) NOT NULL,
  `sequenceNumber` int(2) NOT NULL,
  `gibbonOutcomeID` int(8) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`gibbonRubricRowID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonScale`
--

CREATE TABLE `gibbonScale` (
  `gibbonScaleID` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `usage` varchar(50) NOT NULL,
  `lowestAcceptable` varchar(5) DEFAULT NULL COMMENT 'This is the sequence number of the lowest grade a student can get without being unsatisfactory',
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `numeric` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`gibbonScaleID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `gibbonScale`
--

INSERT INTO `gibbonScale` (`gibbonScaleID`, `name`, `nameShort`, `usage`, `lowestAcceptable`, `active`, `numeric`) VALUES
(00001, 'International Baccalaureate', 'IB', '7 (highest) to 1 (lowest)', '', 'N', 'Y'),
(00002, 'International Baccalaureate EE', 'IBEE', 'A (highest) to E (lowest)', '', 'N', 'N'),
(00003, 'United Kingdom GCSE/iGCSE', 'GCSE', 'A* (highest) to U (lowest)', '', 'Y', 'N'),
(00004, 'Percentage', '%', '100 (highest) to 0 (lowest)', '51', 'Y', 'Y'),
(00005, 'Full Letter Grade', 'FLG', 'A+ (highest) to F (lowest)', '', 'N', 'N'),
(00006, 'Simple Letter Grade', 'SLG', 'A (highest) to F (lowest)', '', 'N', 'N'),
(00007, 'International College HK', 'ICHK', '7 (highest) to 1 (lowest)', '4', 'Y', 'Y'),
(00009, 'Completion', 'Comp', 'Has task has been completed?', '1', 'Y', 'N'),
(00010, 'Cognitive Abilities Test', 'CAT', '140 (highest) to 60 (lowest)', '70', 'Y', 'Y'),
(00011, 'UK National Curriculum KS3', 'KS3', '8A (highest) to B3 (lowest)', '14', 'Y', 'N'),
(00012, 'United Kingdom GCSE/iGCSE Predicted', 'GPrd', '8A (highest) to B3 (lowest)', '', 'Y', 'N'),
(00013, 'IB Diploma (Subject)', 'IBDS', '7 (highest) to 1 (lowest)', '4', 'Y', 'Y'),
(00014, 'IB Diploma (Total)', 'IBDT', '45 (highest) to 0', '22', 'Y', 'Y'),
(00015, 'UK National Curriculum KS3 Simplified', 'KS3S', 'Level 8 (highest) to Level 3 (lowest)', '4', 'Y', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `gibbonScaleGrade`
--

CREATE TABLE `gibbonScaleGrade` (
  `gibbonScaleGradeID` int(7) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonScaleID` int(5) unsigned zerofill NOT NULL,
  `value` varchar(10) NOT NULL,
  `descriptor` varchar(50) NOT NULL,
  `sequenceNumber` int(5) NOT NULL,
  PRIMARY KEY (`gibbonScaleGradeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=332 ;

--
-- Dumping data for table `gibbonScaleGrade`
--

INSERT INTO `gibbonScaleGrade` (`gibbonScaleGradeID`, `gibbonScaleID`, `value`, `descriptor`, `sequenceNumber`) VALUES
(0000001, 00001, '7', '7', 1),
(0000002, 00001, '6', '6', 2),
(0000003, 00001, '5', '5', 3),
(0000004, 00001, '4', '4', 4),
(0000005, 00001, '3', '3', 5),
(0000006, 00001, '2', '2', 6),
(0000007, 00001, '1', '1', 7),
(0000008, 00002, 'A', '49–60', 1),
(0000009, 00002, 'B', '40–48', 2),
(0000010, 00002, 'C', '32–39', 3),
(0000011, 00002, 'D', '22–31', 4),
(0000012, 00002, 'E', '0–21', 5),
(0000013, 00003, 'A*', 'A*', 1),
(0000014, 00003, 'A', 'A', 2),
(0000015, 00003, 'B', 'B', 3),
(0000016, 00003, 'C', 'C', 4),
(0000017, 00003, 'D', 'D', 5),
(0000018, 00003, 'E', 'E', 6),
(0000019, 00003, 'F', 'F', 7),
(0000020, 00003, 'G', 'G', 8),
(0000021, 00003, 'U', 'Unclassified', 9),
(0000022, 00004, '100%', '100%', 1),
(0000023, 00004, '99%', '99%', 2),
(0000024, 00004, '98%', '98%', 3),
(0000025, 00004, '97%', '97%', 4),
(0000026, 00004, '96%', '96%', 5),
(0000027, 00004, '95%', '95%', 6),
(0000028, 00004, '94%', '94%', 7),
(0000029, 00004, '93%', '93%', 8),
(0000030, 00004, '92%', '92%', 9),
(0000031, 00004, '91%', '91%', 10),
(0000032, 00004, '90%', '90%', 11),
(0000033, 00004, '89%', '89%', 12),
(0000034, 00004, '88%', '88%', 13),
(0000035, 00004, '87%', '87%', 14),
(0000036, 00004, '86%', '86%', 15),
(0000037, 00004, '85%', '85%', 16),
(0000038, 00004, '84%', '84%', 17),
(0000039, 00004, '83%', '83%', 18),
(0000040, 00004, '82%', '82%', 19),
(0000041, 00004, '81%', '81%', 20),
(0000042, 00004, '80%', '80%', 21),
(0000043, 00004, '79%', '79%', 22),
(0000044, 00004, '78%', '78%', 23),
(0000045, 00004, '77%', '77%', 24),
(0000046, 00004, '76%', '76%', 25),
(0000047, 00004, '75%', '75%', 26),
(0000048, 00004, '74%', '74%', 27),
(0000049, 00004, '73%', '73%', 28),
(0000050, 00004, '72%', '72%', 29),
(0000051, 00004, '71%', '71%', 30),
(0000052, 00004, '70%', '70%', 31),
(0000053, 00004, '69%', '69%', 32),
(0000054, 00004, '68%', '68%', 33),
(0000055, 00004, '67%', '67%', 34),
(0000056, 00004, '66%', '66%', 35),
(0000057, 00004, '65%', '65%', 36),
(0000058, 00004, '64%', '64%', 37),
(0000059, 00004, '63%', '63%', 38),
(0000060, 00004, '62%', '62%', 39),
(0000061, 00004, '61%', '61%', 40),
(0000062, 00004, '60%', '60%', 41),
(0000063, 00004, '59%', '59%', 42),
(0000064, 00004, '58%', '58%', 43),
(0000065, 00004, '57%', '57%', 44),
(0000066, 00004, '56%', '56%', 45),
(0000067, 00004, '55%', '55%', 46),
(0000068, 00004, '54%', '54%', 47),
(0000069, 00004, '53%', '53%', 48),
(0000070, 00004, '52%', '52%', 49),
(0000071, 00004, '51%', '51%', 50),
(0000072, 00004, '50%', '50%', 51),
(0000073, 00004, '49%', '49%', 52),
(0000074, 00004, '48%', '48%', 53),
(0000075, 00004, '47%', '47%', 54),
(0000076, 00004, '46%', '46%', 55),
(0000077, 00004, '45%', '45%', 56),
(0000078, 00004, '44%', '44%', 57),
(0000079, 00004, '43%', '43%', 58),
(0000080, 00004, '42%', '42%', 59),
(0000081, 00004, '41%', '41%', 60),
(0000082, 00004, '40%', '40%', 61),
(0000083, 00004, '39%', '39%', 62),
(0000084, 00004, '38%', '38%', 63),
(0000085, 00004, '37%', '37%', 64),
(0000086, 00004, '36%', '36%', 65),
(0000087, 00004, '35%', '35%', 66),
(0000088, 00004, '34%', '34%', 67),
(0000089, 00004, '33%', '33%', 68),
(0000090, 00004, '32%', '32%', 69),
(0000091, 00004, '31%', '31%', 70),
(0000092, 00004, '30%', '30%', 71),
(0000093, 00004, '29%', '29%', 72),
(0000094, 00004, '28%', '28%', 73),
(0000095, 00004, '27%', '27%', 74),
(0000096, 00004, '26%', '26%', 75),
(0000097, 00004, '25%', '25%', 76),
(0000098, 00004, '24%', '24%', 77),
(0000099, 00004, '23%', '23%', 78),
(0000100, 00004, '22%', '22%', 79),
(0000101, 00004, '21%', '21%', 80),
(0000102, 00004, '20%', '20%', 81),
(0000103, 00004, '19%', '19%', 82),
(0000104, 00004, '18%', '18%', 83),
(0000105, 00004, '17%', '17%', 84),
(0000106, 00004, '16%', '16%', 85),
(0000107, 00004, '15%', '15%', 86),
(0000108, 00004, '14%', '14%', 87),
(0000109, 00004, '13%', '13%', 88),
(0000110, 00004, '12%', '12%', 89),
(0000111, 00004, '11%', '11%', 90),
(0000112, 00004, '10%', '10%', 91),
(0000113, 00004, '9%', '9%', 92),
(0000114, 00004, '8%', '8%', 93),
(0000115, 00004, '7%', '7%', 94),
(0000116, 00004, '6%', '6%', 95),
(0000117, 00004, '5%', '5%', 96),
(0000118, 00004, '4%', '4%', 97),
(0000119, 00004, '3%', '3%', 98),
(0000120, 00004, '2%', '2%', 99),
(0000121, 00004, '1%', '2%', 100),
(0000122, 00004, '0%', '0%', 101),
(0000123, 00005, 'A+', 'A+', 1),
(0000124, 00005, 'A', 'A', 2),
(0000125, 00005, 'A-', 'A-', 3),
(0000126, 00005, 'B+', 'B+', 4),
(0000127, 00005, 'B', 'B', 5),
(0000128, 00005, 'B-', 'B-', 6),
(0000129, 00005, 'C+', 'C+', 7),
(0000130, 00005, 'C', 'C', 8),
(0000131, 00005, 'C-', 'C-', 9),
(0000132, 00005, 'D+', 'D+', 10),
(0000133, 00005, 'D', 'D', 11),
(0000134, 00005, 'D-', 'D-', 12),
(0000135, 00005, 'E+', 'E+', 13),
(0000136, 00005, 'E', 'E', 14),
(0000137, 00005, 'E-', 'E-', 15),
(0000138, 00005, 'F', 'F', 16),
(0000139, 00006, 'A', 'A', 1),
(0000140, 00006, 'B', 'B', 2),
(0000141, 00006, 'C', 'C', 3),
(0000142, 00006, 'D', 'D', 4),
(0000143, 00006, 'E', 'E', 5),
(0000144, 00006, 'F', 'F', 6),
(0000145, 00007, '7', 'Excellent', 1),
(0000146, 00007, '6', 'Very Good', 2),
(0000147, 00007, '5', 'Good', 3),
(0000148, 00007, '4', 'Satisfactory', 4),
(0000149, 00007, '3', 'Unsatisfactory', 5),
(0000150, 00007, '2', 'Poor', 6),
(0000151, 00007, '1', 'Cause for Concern', 7),
(0000152, 00009, 'Complete', 'Work complete', 1),
(0000153, 00009, 'Incomplete', 'Work incomplete', 3),
(0000154, 00009, 'Late', 'Work submitted late', 2),
(0000155, 00007, 'Incomplete', 'Work incomplete', 8),
(0000156, 00001, 'Incomplete', 'Work incomplete', 8),
(0000157, 00003, 'Incomplete', 'Work incomplete', 10),
(0000158, 00004, 'Incomplete', 'Work incomplete', 102),
(0000159, 00005, 'Incomplete', 'Work incomplete', 17),
(0000160, 00006, 'Incomplete', 'Work incomplete', 7),
(0000162, 00010, '60', '60', 110),
(0000163, 00010, '61', '61', 109),
(0000164, 00010, '62', '62', 108),
(0000165, 00010, '63', '63', 107),
(0000166, 00010, '64', '64', 106),
(0000167, 00010, '65', '65', 105),
(0000168, 00010, '66', '66', 104),
(0000169, 00010, '67', '67', 103),
(0000170, 00010, '68', '68', 102),
(0000171, 00010, '69', '69', 101),
(0000172, 00010, '70', '70', 100),
(0000173, 00010, '71', '71', 99),
(0000174, 00010, '72', '72', 98),
(0000175, 00010, '73', '73', 97),
(0000176, 00010, '74', '74', 96),
(0000177, 00010, '75', '75', 95),
(0000178, 00010, '76', '76', 94),
(0000179, 00010, '77', '77', 93),
(0000180, 00010, '78', '78', 92),
(0000181, 00010, '79', '79', 91),
(0000182, 00010, '80', '80', 90),
(0000183, 00010, '81', '81', 89),
(0000184, 00010, '82', '82', 88),
(0000185, 00010, '83', '83', 87),
(0000186, 00010, '84', '84', 86),
(0000187, 00010, '85', '85', 85),
(0000188, 00010, '86', '86', 84),
(0000189, 00010, '87', '87', 83),
(0000190, 00010, '88', '88', 82),
(0000191, 00010, '89', '89', 81),
(0000192, 00010, '90', '90', 80),
(0000193, 00010, '91', '91', 79),
(0000194, 00010, '92', '92', 78),
(0000195, 00010, '93', '93', 77),
(0000196, 00010, '94', '94', 76),
(0000197, 00010, '95', '95', 75),
(0000198, 00010, '96', '96', 74),
(0000199, 00010, '97', '97', 73),
(0000200, 00010, '98', '98', 72),
(0000201, 00010, '99', '99', 71),
(0000202, 00010, '100', '100', 70),
(0000203, 00010, '101', '101', 69),
(0000204, 00010, '102', '102', 68),
(0000205, 00010, '103', '103', 67),
(0000206, 00010, '104', '104', 66),
(0000207, 00010, '105', '105', 65),
(0000208, 00010, '106', '106', 64),
(0000209, 00010, '107', '107', 63),
(0000210, 00010, '108', '108', 62),
(0000211, 00010, '109', '109', 61),
(0000212, 00010, '110', '110', 60),
(0000213, 00010, '111', '111', 59),
(0000214, 00010, '112', '112', 58),
(0000215, 00010, '113', '113', 57),
(0000216, 00010, '114', '114', 56),
(0000217, 00010, '115', '115', 55),
(0000218, 00010, '116', '116', 54),
(0000219, 00010, '117', '117', 53),
(0000220, 00010, '118', '118', 52),
(0000221, 00010, '119', '119', 51),
(0000222, 00010, '120', '120', 50),
(0000223, 00010, '121', '121', 49),
(0000224, 00010, '122', '122', 48),
(0000225, 00010, '123', '123', 47),
(0000226, 00010, '124', '124', 46),
(0000227, 00010, '125', '125', 45),
(0000228, 00010, '126', '126', 44),
(0000229, 00010, '127', '127', 43),
(0000230, 00010, '128', '128', 42),
(0000231, 00010, '129', '129', 41),
(0000232, 00010, '130', '130', 40),
(0000233, 00010, '131', '131', 39),
(0000234, 00010, '132', '132', 38),
(0000235, 00010, '133', '133', 37),
(0000236, 00010, '134', '134', 36),
(0000237, 00010, '135', '135', 35),
(0000238, 00010, '136', '136', 34),
(0000239, 00010, '137', '137', 33),
(0000240, 00010, '138', '138', 32),
(0000241, 00010, '139', '139', 31),
(0000242, 00010, '140', '140', 30),
(0000243, 00011, '8A', '8A', 1),
(0000244, 00011, '8B', '8B', 2),
(0000245, 00011, '8C', '8C', 3),
(0000246, 00011, '7A', '7A', 4),
(0000247, 00011, '7B', '7B', 5),
(0000248, 00011, '7C', '7C', 6),
(0000249, 00011, '6A', '6A', 7),
(0000250, 00011, '6B', '6B', 8),
(0000251, 00011, '6C', '6C', 9),
(0000252, 00011, '5A', '5A', 9),
(0000253, 00011, '5B', '5B', 10),
(0000254, 00011, '5C', '5C', 11),
(0000255, 00011, '4A', '4A', 12),
(0000256, 00011, '4B', '4B', 13),
(0000257, 00011, '4C', '4C', 14),
(0000258, 00011, 'B3', 'B3', 15),
(0000259, 00012, 'A', 'A', 1),
(0000260, 00012, 'A/B', 'A/B', 2),
(0000261, 00012, 'B', 'B', 3),
(0000262, 00012, 'B/C', 'B/C', 4),
(0000263, 00012, 'C', 'C', 5),
(0000264, 00012, 'C/D', 'C/D', 6),
(0000265, 00012, 'D', 'D', 7),
(0000266, 00012, 'D/E', 'D/E', 8),
(0000267, 00012, 'E', 'E', 9),
(0000268, 00012, 'E/F', 'E/F', 10),
(0000269, 00012, 'F', 'F', 11),
(0000270, 00012, 'G', 'G', 12),
(0000271, 00012, 'U', 'Unclassified', 13),
(0000272, 00010, '141', '141', 29),
(0000273, 00013, '7', '7', 1),
(0000274, 00013, '6', '6', 2),
(0000275, 00013, '5', '5', 3),
(0000276, 00013, '4', '4', 4),
(0000277, 00013, '3', '3', 5),
(0000278, 00013, '2', '2', 6),
(0000279, 00013, '1', '1', 7),
(0000280, 00014, '45', '45', 1),
(0000281, 00014, '44', '44', 2),
(0000282, 00014, '43', '43', 3),
(0000283, 00014, '42', '42', 4),
(0000284, 00014, '41', '41', 5),
(0000285, 00014, '40', '40', 6),
(0000286, 00014, '39', '39', 7),
(0000287, 00014, '38', '38', 8),
(0000288, 00014, '37', '37', 9),
(0000289, 00014, '36', '36', 10),
(0000290, 00014, '35', '35', 11),
(0000291, 00014, '34', '34', 12),
(0000292, 00014, '33', '33', 13),
(0000293, 00014, '32', '32', 14),
(0000294, 00014, '31', '31', 15),
(0000295, 00014, '30', '30', 16),
(0000296, 00014, '29', '29', 17),
(0000297, 00014, '28', '28', 18),
(0000298, 00014, '27', '27', 19),
(0000299, 00014, '26', '26', 20),
(0000300, 00014, '25', '25', 21),
(0000301, 00014, '24', '24', 22),
(0000302, 00014, '23', '23', 23),
(0000303, 00014, '22', '22', 24),
(0000304, 00014, '21', '21', 25),
(0000305, 00014, '20', '20', 26),
(0000306, 00014, '19', '19', 27),
(0000307, 00014, '18', '18', 28),
(0000308, 00014, '17', '17', 29),
(0000309, 00014, '16', '16', 30),
(0000310, 00014, '15', '15', 31),
(0000311, 00014, '14', '14', 32),
(0000312, 00014, '13', '13', 33),
(0000313, 00014, '12', '12', 34),
(0000314, 00014, '11', '11', 35),
(0000315, 00014, '10', '10', 36),
(0000316, 00014, '9', '9', 37),
(0000317, 00014, '8', '8', 38),
(0000318, 00014, '7', '7', 39),
(0000319, 00014, '6', '6', 40),
(0000320, 00014, '5', '5', 41),
(0000321, 00014, '4', '4', 42),
(0000322, 00014, '3', '3', 43),
(0000323, 00014, '2', '2', 44),
(0000324, 00014, '1', '1', 45),
(0000325, 00015, '8', 'Level 8', 1),
(0000326, 00015, '7', 'Level 7', 2),
(0000327, 00015, '6', 'Level 6', 3),
(0000328, 00015, '5', 'Level 5', 4),
(0000329, 00015, '4', 'Level 4', 5),
(0000330, 00015, '3', 'Level 3', 6);

-- --------------------------------------------------------

--
-- Table structure for table `gibbonSchoolYear`
--

CREATE TABLE `gibbonSchoolYear` (
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(9) NOT NULL DEFAULT '',
  `status` enum('Past','Current','Upcoming') NOT NULL DEFAULT 'Upcoming',
  `sequenceNumber` int(3) NOT NULL,
  `firstDay` date DEFAULT NULL,
  `lastDay` date DEFAULT NULL,
  PRIMARY KEY (`gibbonSchoolYearID`),
  UNIQUE KEY `academicYearName` (`name`),
  UNIQUE KEY `sequenceNumber` (`sequenceNumber`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `gibbonSchoolYear`
--

INSERT INTO `gibbonSchoolYear` (`gibbonSchoolYearID`, `name`, `status`, `sequenceNumber`, `firstDay`, `lastDay`) VALUES
(012, '2009-2010', 'Past', 1, '2009-08-25', '2010-06-29'),
(008, '2010-2011', 'Past', 2, '2010-08-25', '2011-06-29'),
(014, '2011-2012', 'Past', 3, '2011-08-25', '2012-06-29'),
(018, '2012-2013', 'Current', 4, '2012-08-22', '2013-06-28'),
(019, '2013-2014', 'Upcoming', 5, '2013-08-21', '2014-06-27'),
(020, '2014-2015', 'Upcoming', 6, '2014-08-28', '2015-06-28');

-- --------------------------------------------------------

--
-- Table structure for table `gibbonSchoolYearSpecialDay`
--

CREATE TABLE `gibbonSchoolYearSpecialDay` (
  `gibbonSchoolYearSpecialDayID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonSchoolYearTermID` int(5) unsigned zerofill NOT NULL,
  `type` enum('School Closure','Timing Change') NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `schoolOpen` time DEFAULT NULL,
  `schoolStart` time DEFAULT NULL,
  `schoolEnd` time DEFAULT NULL,
  `schoolClose` time DEFAULT NULL,
  PRIMARY KEY (`gibbonSchoolYearSpecialDayID`),
  UNIQUE KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonSchoolYearTerm`
--

CREATE TABLE `gibbonSchoolYearTerm` (
  `gibbonSchoolYearTermID` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `sequenceNumber` int(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `firstDay` date NOT NULL,
  `lastDay` date NOT NULL,
  PRIMARY KEY (`gibbonSchoolYearTermID`),
  UNIQUE KEY `sequenceNumber` (`sequenceNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonSetting`
--

CREATE TABLE `gibbonSetting` (
  `gibbonSystemSettingsID` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `scope` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `nameDisplay` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`gibbonSystemSettingsID`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `nameDisplay` (`nameDisplay`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100 ;

--
-- Dumping data for table `gibbonSetting`
--

INSERT INTO `gibbonSetting` (`gibbonSystemSettingsID`, `scope`, `name`, `nameDisplay`, `description`, `value`) VALUES
(00001, 'System', 'absoluteURL', 'Base URL', 'The address at which the whole system resides.', ''),
(00002, 'System', 'organisationName', 'Organisation Name', '', 'Gibbon'),
(00003, 'System', 'organisationNameShort', 'Organisation Initials', '', 'GBN'),
(00004, 'System', 'organisationAdministratorName', 'System Administrator', '', ''),
(00005, 'System', 'organisationAdministratorEmail', 'System Administrator Email', '', ''),
(00006, 'System', 'pagination', 'Pagination Count', 'Must be numeric. Number of records shown per page.', '50'),
(00007, 'System', 'systemName', 'System Name', '', 'Gibbon'),
(00008, 'System', 'indexText', 'Index Page Text', 'Text displayed in system''s welcome page.', 'Welcome to Gibbon.'),
(00009, 'System', 'absolutePath', 'Base Path', 'The local FS path to the system', ''),
(00011, 'System', 'timezone', 'Timezone', 'The <a href=''http://php.net/manual/en/timezones.php''>timezone</a> where the school is located', 'Asia/Hong_Kong'),
(00013, 'System', 'analytics', 'Analytics', 'Javascript code to integrate statistics, such as Google Analytics', ''),
(00014, 'System', 'emailLink', 'Link To Email', 'The link that points to the school/''s email system', ''),
(00015, 'System', 'webLink', 'Link To Web', 'The link that points to the school/''s website', ''),
(00016, 'System', 'organisationDBAName', 'DBA', 'Database Administrator', ''),
(00017, 'System', 'organisationDBAEmail', 'DBA Email', '', ''),
(00018, 'System', 'primaryAssessmentScale', 'Primary Assessment Scale', 'The most commonly used, or official, assessment scale for the school.', '00007'),
(00019, 'System', 'organisationAdmissionsName', 'Admissions Officer', '', ''),
(00020, 'System', 'organisationAdmissionsEmail', 'Admissions Officer Email', '', ''),
(00021, 'System', 'country', 'Country', 'The country the school is located in', 'Hong Kong'),
(00022, 'System', 'organisationLogo', 'Logo', 'Relative path to site logo (250x107px)', 'themes/Default/img/logo.jpg'),
(00023, 'System', 'calendarFeed', 'Calendar Feed', 'XML feed for the school calendar (Google Calendar only)', ''),
(00024, 'Activities', 'access', 'Access', 'System-wide access control', 'Register'),
(00025, 'Activities', 'payment', 'Payment', 'Payment system', 'Per Activity'),
(00026, 'Activities', 'enrolmentType', 'Enrolment Type', 'Enrolment process type', 'Competitive'),
(00027, 'Activities', 'backupChoice', 'Backup Choice', 'Allow students to choose a backup, in case enroled activity is full.', 'Y'),
(00028, 'Activities', 'activityTypes', 'Activity Types', 'Comma-seperated list of the different activity types available in school. Leave blank to disalbe this feature.', 'Creativity,Action,Service'),
(00029, 'Application Form', 'introduction', 'Introduction', 'Information to display before the form', ''),
(00030, 'Application Form', 'postscript', 'Postscript', 'Information to display at the end of the form', ''),
(00031, 'Application Form', 'scholarships', 'Scholarships', 'Information to display before the scholarship options', ''),
(00032, 'Application Form', 'agreement', 'Agreement', 'Without this text, which is displayed above the agreement, users will not be asked to agree to anything', ''),
(00033, 'Application Form', 'publicApplications', 'Public Applications?', 'If yes, members of the public can submit applications', 'Y'),
(00034, 'Behaviour', 'positiveDescriptors', 'Positive Descriptors', 'Allowalbe choices for positive behaviour', 'Attitude to learning,Collaboration,Community spirit,Creativity,Effort,Leadership,Participation,Persistence,Problem solving,Quality of work,Values'),
(00035, 'Behaviour', 'negativeDescriptors', 'Negative Descriptors', 'Allowalbe choices for negative behaviour', 'Classwork - Late,Classwork - Incomplete,Classwork - Unacceptable,Disrespectful,Disruptive,Homework - Late,Homework - Incomplete,Homework - Unacceptable,ICT Misuse,Truancy,Other'),
(00036, 'Behaviour', 'levels', 'Levels', 'Allowalbe choices for severity level (from lowest to highest)', ',Stage 1,Stage 1 (Actioned),Stage 2,Stage 2 (Actioned),Stage 3,Stage 3 (Actioned),Actioned'),
(00037, 'Resources', 'categories', 'Categories', 'Allowable choices for category', 'Article,Book,Document,Graphic,Idea,Music,Object,Painting,Person,Photo,Place,Poetry,Prose,Rubric,Text,Video,Website,Work Sample,Other'),
(00038, 'Resources', 'purposesGeneral', 'Purposes (General)', 'Allowable choices for purpose when creating a resource', 'Assessment Aid,Concept,Inspiration,Learner Profile,Mass Mailer Attachment,Provocation,Skill,Teaching and Learning Strategy,Other'),
(00039, 'System', 'version', 'Version', 'The version of the Gibbon database', '6.0.00'),
(00040, 'Resources', 'purposesRestricted', 'Purposes (Restricted)', 'Additional allowable choices for purpose when creating a resource, for those with "Manage All Resources" rights', ''),
(00041, 'System', 'organisationEmail', 'Organisation Email', 'General email address for the school', ''),
(00042, 'Activities', 'dateType', 'Date Type', 'Should activities be organised around dates (flexible) or terms (easy)?', 'Term'),
(00043, 'System', 'installType', 'Install Type', 'The purpose of this installation of Gibbon', 'Production'),
(00044, 'System', 'statsCollection', 'Statistics Collection', 'To track Gibbon uptake, the system tracks basic data (current URL, install type, organisation name) on each install. Do you want to help?', 'Y'),
(00045, 'Activities', 'maxPerTerm', 'Maximum Activities per Term', 'The most a student can sign up for in one term. Set to 0 for unlimited.', '2'),
(00046, 'Planner', 'lessonDetailsTemplate', 'Lesson Details Template', 'Template to be inserted into Lesson Details field', ''),
(00047, 'Planner', 'teachersNotesTemplate', 'Teacher''s Notes Template', 'Template to be inserted into Teacher''s Notes field', ''),
(00048, 'Planner', 'smartBlockTemplate', 'Smart Block Template', 'Template to be inserted into new block in Smart Unit', ''),
(00049, 'Planner', 'unitOutlineTemplate', 'Unit Outline Template', 'Template to be inserted into Unit Outline section of planner', ''),
(00050, 'Application Form', 'milestones', 'Milestones', 'Comma-separated list of the major steps in the application process. Applicants can be tracked through the various stages.', ''),
(00051, 'Library', 'defaultLoanLength', 'Default Loan Length', 'The standard loan length for a library item, in days', '7'),
(00052, 'Behaviour', 'policyLink', 'Policy Link', 'A link to the school behaviour policy.', ''),
(00053, 'Library', 'browseBGColor', 'Browse Library BG Color', 'RGB Hex value, without leading #. Background color used behind library browsing screen.', ''),
(00054, 'Library', 'browseBGImage', 'Browse Library BG Image', 'URL to background image used behind library browsing screen.', ''),
(00055, 'System', 'passwordPolicyAlpha', 'Alpha Requirement', 'Require both upper and lower case alpha characters?', 'Y'),
(00056, 'System', 'passwordPolicyNumeric', 'Numeric Requirement', 'Require at least one numeric character?', 'Y'),
(00057, 'System', 'passwordPolicyNonAlphaNumeric', 'Non-Alphanumeric Requirement', 'Require at least one non-alphanumeric character (e.g. punctuation mark or space)?', 'N'),
(00058, 'System', 'passwordPolicyMinLength', 'Minimum Length', 'Minimum acceptable password length.', '8'),
(00059, 'User Admin', 'ethnicity', 'Ethnicity', 'Comma-separated list of ethnicities available in system', 'Arctic,Caucasian - European,Caucasian - Indian,Caucasian - Middle East,Caucasian - North African,Caucasian - Other,Indigenous Australian,Native American,North East Asian,Pacific,South East Asian,West African/Bushmen/Ethiopian,Eurasian,Other'),
(00060, 'User Admin', 'nationality', 'Nationality', 'Comma-separated list of nationalities available in system. If blank, system will default to list of countries', 'American (USA),Canadian,Other Central and south American countries,Australian,New Zealander,British (not including B.N.O holder),Dutch,French,German,Irish,Italian,Portuguese,Spanish,Swiss,Other European (European Union Countries),Other European (Non-European Union Countries),Israeli,Bangladeshi,Filipino,Indian,Indonesian,Japanese ,Korean,Malaysian,Nepalese,Pakistani,Singaporean,Sri-Lankan,Thai,Vietnamese,HKPR not including any foreign passport (except B.N.O),Chinese (e.g Mainlanders, Macanese and Taiwanese),Other Asian,Russian and counties of the Commonwealth of Independent States,African Countries,Others'),
(00061, 'User Admin', 'residencyStatus', 'Residency Status', 'Comma-separated list of residency status available in system. If blank, system will allow text input', 'Citizen,Resident,Student,Other '),
(00063, 'User Admin', 'personalDataUpdaterRequiredFields', 'Personal Data Updater Required Fields', 'Serialized array listed personal fields in data updater, and whether or not they are required.', 'a:47:{s:5:"title";s:1:"N";s:7:"surname";s:1:"Y";s:9:"firstName";s:1:"N";s:10:"otherNames";s:1:"N";s:13:"preferredName";s:1:"Y";s:12:"officialName";s:1:"Y";s:16:"nameInCharacters";s:1:"N";s:3:"dob";s:1:"N";s:5:"email";s:1:"N";s:14:"emailAlternate";s:1:"N";s:8:"address1";s:1:"N";s:16:"address1District";s:1:"N";s:15:"address1Country";s:1:"N";s:8:"address2";s:1:"N";s:16:"address2District";s:1:"N";s:15:"address2Country";s:1:"N";s:10:"phone1Type";s:1:"N";s:17:"phone1CountryCode";s:1:"N";s:6:"phone1";s:1:"N";s:6:"phone2";s:1:"N";s:6:"phone3";s:1:"N";s:6:"phone4";s:1:"N";s:13:"languageFirst";s:1:"N";s:14:"languageSecond";s:1:"N";s:13:"languageThird";s:1:"N";s:14:"countryOfBirth";s:1:"N";s:9:"ethnicity";s:1:"N";s:12:"citizenship1";s:1:"N";s:20:"citizenship1Passport";s:1:"N";s:12:"citizenship2";s:1:"N";s:20:"citizenship2Passport";s:1:"N";s:8:"religion";s:1:"N";s:20:"nationalIDCardNumber";s:1:"N";s:15:"residencyStatus";s:1:"N";s:14:"visaExpiryDate";s:1:"N";s:10:"profession";s:1:"N";s:8:"employer";s:1:"N";s:8:"jobTitle";s:1:"N";s:14:"emergency1Name";s:1:"N";s:17:"emergency1Number1";s:1:"N";s:17:"emergency1Number2";s:1:"N";s:22:"emergency1Relationship";s:1:"N";s:14:"emergency2Name";s:1:"N";s:17:"emergency2Number1";s:1:"N";s:17:"emergency2Number2";s:1:"N";s:22:"emergency2Relationship";s:1:"N";s:19:"vehicleRegistration";s:1:"N";}'),
(00065, 'School Admin', 'primaryExternalAssessmentByYearGroup', 'Primary External Assessment By Year Group', 'Serialized array connected gibbonExternalAssessmentID to gibbonYearGroupID, and specify which field set to use.', 'a:7:{s:3:"001";s:1:"-";s:3:"002";s:1:"-";s:3:"003";s:1:"-";s:3:"004";s:1:"-";s:3:"005";s:1:"-";s:3:"006";s:1:"-";s:3:"007";s:1:"-";}'),
(00066, 'Markbook', 'markbookType', 'Markbook Type', 'Comma-separated list of types to make available in the Markbook.', 'Essay,Exam,Homework,Reflection,Test,Unit,End of Year,Other'),
(00067, 'System', 'allowableHTML', 'Allowable HTML', 'TinyMCE-style list of acceptable HTML tags and options.', 'article[*],aside[*],audio[*],canvas[*],command[*],datalist[*],details[*],embed[*],figcaption[*],figure[*],footer[*],header[*],hgroup[*],iframe[*],keygen[*],mark[*],meter[*],nav[*],object[*],output[*],param[*],progress[*],script[*],section[*],source[*],summary,time[*],video[*],wbr'),
(00068, 'Application Form', 'howDidYouHear', 'How Did Your Hear?', 'Comma-separated list', 'Advertisement,Personal Recommendation,World Wide Web,Others'),
(00069, 'Students', 'noteCategories', 'Note Categories', 'Comma-separated list of categories to be available for organising notes.', 'Academic,Behaviour,Family,Medical,Pastoral,Other'),
(00070, 'Messenger', 'smsUsername', 'SMS Username', 'SMS gateway username.', 'APIK57CMXIV7V'),
(00071, 'Messenger', 'smsPassword', 'SMS Password', 'SMS gateway password.', 'APIK57CMXIV7VK57CM'),
(00072, 'Messenger', 'smsURL', 'SMS URL', 'SMS gateway URL for send requests.', 'http://gateway.onewaysms.hk:10002/api.aspx'),
(00073, 'Messenger', 'smsURLCredit', 'SMS URL Credit', 'SMS gateway URL for checking credit.', 'http://gateway.onewaysms.hk:10002/bulkcredit.aspx'),
(00074, 'System', 'currency', 'Currency', 'System-wde currency for financial transactions.', 'USD $'),
(00075, 'System', 'enablePayments', 'Enable Payments', 'Should payments be enabled across the system?', 'N'),
(00076, 'System', 'paypalAPIUsername', 'PayPal API Username', 'API Username provided by PayPal.', ''),
(00077, 'System', 'paypalAPIPassword', 'PayPal API Password', 'API Password provided by PayPal.', ''),
(00078, 'System', 'paypalAPISignature', 'PayPal API Signature', 'API Signature provided by PayPal.', ''),
(00080, 'Application Form', 'requiredDocuments', 'Required Documents', 'Comma-separated list of documents which must be submitted electronically with the application form.', ''),
(00079, 'Application Form', 'applicationFee', 'Application Fee', 'The cost of applying to the school.', '0'),
(00081, 'Application Form', 'requiredDocumentsCompulsory', 'Required Documents Compulsory?', 'Are the required documents compulsory?', 'N'),
(00082, 'Application Form', 'requiredDocumentsText', 'Required Documents Text', 'Explanatory text to appear with the required documents?', ''),
(00083, 'Application Form', 'notificationDefault', 'Notification Default', 'Should acceptance email be turned on or off by default.', 'On'),
(00084, 'Application Form', 'languageOptionsActive', 'Language Options Active', 'Should the Language Options section be turned on?', 'Off'),
(00085, 'Application Form', 'languageOptionsBlurb', 'Language Options Blurb', 'Introductory text if Language Options section is turned on.', ''),
(00086, 'Application Form', 'languageOptionsLanguageList', 'Language Options Language List', 'Comma-separated list of available language selections if Language Options section is turned on.', ''),
(00087, 'Markbook', 'wordpressCommentPush', 'Wordpress Comment Push', 'Where student work is submitted via a WordPress website, the teacher can choose to push their Markbook comment to the site.', 'On'),
(00088, 'User Admin', 'personalBackground', 'Personal Background', 'Should users be allowed to set their own personal backgrounds?', 'Y'),
(00091, 'Application Form', 'dayTypeOptions', 'Day-Type Options', 'Comma-separated list of options to make available (e.g. half-day, full-day). If blank, this field will not show up in the application form. ', ''),
(00092, 'Application Form', 'dayTypeText', 'Day-Type Text', 'Explanatory text to include with Day-Type Otpions.', ''),
(00096, 'Markbook', 'showStudentEffortWarning', 'Show Student Effort Warning', 'Show low effort grade visual warning to students?', 'Y'),
(00095, 'Markbook', 'showStudentAttainmentWarning', 'Show Student Attainment Warning', 'Show low attainment grade visual warning to students?', 'Y'),
(00097, 'Markbook', 'showParentAttainmentWarning', 'Show Parent Attainment Warning', 'Show low attainment grade visual warning to parents?', 'Y'),
(00098, 'Markbook', 'showParentEffortWarning', 'Show Parent Effort Warning', 'Show low effort grade visual warning to parents?', 'Y'),
(00099, 'Planner', 'allowOutcomeEditing', 'Allow Outcome Editing', 'Should the text within outcomes be editable when planning lessons and units?', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `gibbonSpace`
--

CREATE TABLE `gibbonSpace` (
  `gibbonSpaceID` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `type` enum('Classroom','Performance','Hall','Outdoor','Undercover','Storage','Office','Staffroom','Study','Library','Other') NOT NULL,
  `gibbonPersonID1` int(10) unsigned zerofill DEFAULT NULL,
  `gibbonPersonID2` int(10) unsigned zerofill DEFAULT NULL,
  `capacity` int(5) NOT NULL,
  `computer` enum('N','Y') NOT NULL,
  `computerStudent` int(3) NOT NULL DEFAULT '0',
  `projector` enum('N','Y') NOT NULL,
  `tv` enum('N','Y') NOT NULL,
  `dvd` enum('N','Y') NOT NULL,
  `hifi` enum('N','Y') NOT NULL,
  `speakers` enum('N','Y') NOT NULL,
  `iwb` enum('N','Y') NOT NULL,
  `phoneInternal` varchar(5) NOT NULL,
  `phoneExternal` varchar(20) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`gibbonSpaceID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonStaff`
--

CREATE TABLE `gibbonStaff` (
  `gibbonStaffID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `type` enum('Teaching','Support') NOT NULL,
  `jobTitle` varchar(100) NOT NULL,
  `smartWorkflowHelp` enum('N','Y') NOT NULL DEFAULT 'N',
  `firstAidQualified` enum('','N','Y') NOT NULL DEFAULT '',
  `firstAidExpiry` date DEFAULT NULL,
  PRIMARY KEY (`gibbonStaffID`),
  UNIQUE KEY `gibbonPersonID` (`gibbonPersonID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonStudentEnrolment`
--

CREATE TABLE `gibbonStudentEnrolment` (
  `gibbonStudentEnrolmentID` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `gibbonYearGroupID` int(3) unsigned zerofill NOT NULL,
  `gibbonRollGroupID` int(5) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonStudentEnrolmentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonStudentNote`
--

CREATE TABLE `gibbonStudentNote` (
  `gibbonStudentNoteID` int(12) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  `category` varchar(255) NOT NULL,
  `note` text NOT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gibbonStudentNoteID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonTheme`
--

CREATE TABLE `gibbonTheme` (
  `gibbonThemeID` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL,
  `active` enum('N','Y') NOT NULL DEFAULT 'N',
  `version` varchar(6) NOT NULL,
  `author` varchar(40) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`gibbonThemeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `gibbonTheme`
--

INSERT INTO `gibbonTheme` (`gibbonThemeID`, `name`, `description`, `active`, `version`, `author`, `url`) VALUES
(0001, 'Default', 'Gibbon''s native appearance', 'Y', '0.1.00', 'Ross Parker', 'http://rossparker.org');

-- --------------------------------------------------------

--
-- Table structure for table `gibbonTT`
--

CREATE TABLE `gibbonTT` (
  `gibbonTTID` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonSchoolYearID` int(3) unsigned zerofill NOT NULL,
  `name` varchar(30) NOT NULL,
  `nameShort` varchar(12) NOT NULL,
  `gibbonYearGroupIDList` varchar(255) NOT NULL,
  `active` enum('Y','N') NOT NULL,
  PRIMARY KEY (`gibbonTTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonTTColumn`
--

CREATE TABLE `gibbonTTColumn` (
  `gibbonTTColumnID` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `nameShort` varchar(12) NOT NULL,
  PRIMARY KEY (`gibbonTTColumnID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonTTColumnRow`
--

CREATE TABLE `gibbonTTColumnRow` (
  `gibbonTTColumnRowID` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonTTColumnID` int(6) unsigned zerofill NOT NULL,
  `name` varchar(12) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `timeStart` time NOT NULL,
  `timeEnd` time NOT NULL,
  `type` enum('Lesson','Pastoral','Sport','Break','Service','Other') NOT NULL,
  PRIMARY KEY (`gibbonTTColumnRowID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonTTDay`
--

CREATE TABLE `gibbonTTDay` (
  `gibbonTTDayID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonTTID` int(8) unsigned zerofill NOT NULL,
  `gibbonTTColumnID` int(6) unsigned zerofill NOT NULL,
  `name` varchar(12) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  PRIMARY KEY (`gibbonTTDayID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonTTDayDate`
--

CREATE TABLE `gibbonTTDayDate` (
  `gibbonTTDayDateID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonTTDayID` int(10) unsigned zerofill NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`gibbonTTDayDateID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonTTDayRowClass`
--

CREATE TABLE `gibbonTTDayRowClass` (
  `gibbonTTDayRowClassID` int(12) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonTTColumnRowID` int(8) unsigned zerofill NOT NULL,
  `gibbonTTDayID` int(10) unsigned zerofill NOT NULL,
  `gibbonCourseClassID` int(8) unsigned zerofill NOT NULL,
  `gibbonSpaceID` int(5) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`gibbonTTDayRowClassID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonTTDayRowClassException`
--

CREATE TABLE `gibbonTTDayRowClassException` (
  `gibbonTTDayRowClassExceptionID` int(14) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonTTDayRowClassID` int(12) unsigned zerofill NOT NULL,
  `gibbonPersonID` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonTTDayRowClassExceptionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonTTImport`
--

CREATE TABLE `gibbonTTImport` (
  `gibbonTTImportID` int(14) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `courseNameShort` varchar(6) NOT NULL,
  `classNameShort` varchar(5) NOT NULL,
  `dayName` varchar(12) NOT NULL,
  `rowName` varchar(12) NOT NULL,
  `teacherUsernameList` text NOT NULL,
  `spaceName` varchar(30) NOT NULL,
  PRIMARY KEY (`gibbonTTImportID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonUnit`
--

CREATE TABLE `gibbonUnit` (
  `gibbonUnitID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonCourseID` int(8) unsigned zerofill NOT NULL,
  `name` varchar(40) NOT NULL,
  `description` text NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `gibbonPersonIDCreator` int(10) unsigned zerofill NOT NULL,
  `gibbonPersonIDLastEdit` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`gibbonUnitID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonUnitBlock`
--

CREATE TABLE `gibbonUnitBlock` (
  `gibbonUnitBlockID` int(12) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonUnitID` int(10) unsigned zerofill NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `length` varchar(3) NOT NULL,
  `contents` text NOT NULL,
  `teachersNotes` text NOT NULL,
  `sequenceNumber` int(4) NOT NULL,
  PRIMARY KEY (`gibbonUnitBlockID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonUnitClass`
--

CREATE TABLE `gibbonUnitClass` (
  `gibbonUnitClassID` int(12) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonUnitID` int(10) unsigned zerofill NOT NULL,
  `gibbonCourseClassID` int(8) unsigned zerofill NOT NULL,
  `running` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`gibbonUnitClassID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonUnitClassBlock`
--

CREATE TABLE `gibbonUnitClassBlock` (
  `gibbonUnitClassBlockID` int(14) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonUnitClassID` int(12) unsigned zerofill NOT NULL,
  `gibbonPlannerEntryID` int(14) unsigned zerofill NOT NULL,
  `gibbonUnitBlockID` int(12) unsigned zerofill NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `length` varchar(3) NOT NULL,
  `contents` text NOT NULL,
  `teachersNotes` text NOT NULL,
  `sequenceNumber` int(4) NOT NULL,
  `complete` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`gibbonUnitClassBlockID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonUnitOutcome`
--

CREATE TABLE `gibbonUnitOutcome` (
  `gibbonUnitOutcomeID` int(12) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `gibbonUnitID` int(10) unsigned zerofill NOT NULL,
  `gibbonOutcomeID` int(8) unsigned zerofill NOT NULL,
  `sequenceNumber` int(4) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`gibbonUnitOutcomeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gibbonYearGroup`
--

CREATE TABLE `gibbonYearGroup` (
  `gibbonYearGroupID` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `sequenceNumber` int(3) NOT NULL,
  PRIMARY KEY (`gibbonYearGroupID`),
  UNIQUE KEY `name` (`name`,`nameShort`,`sequenceNumber`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `gibbonYearGroup`
--

INSERT INTO `gibbonYearGroup` (`gibbonYearGroupID`, `name`, `nameShort`, `sequenceNumber`) VALUES
(001, 'Year 7', 'Y07', 1),
(002, 'Year 8', 'Y08', 2),
(003, 'Year 9', 'Y09', 3),
(004, 'Year 10', 'Y10', 4),
(005, 'Year 11', 'Y11', 5),
(006, 'Year 12', 'Y12', 6),
(007, 'Year 13', 'Y13', 7);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
