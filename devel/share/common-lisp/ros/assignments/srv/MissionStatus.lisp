; Auto-generated. Do not edit!


(cl:in-package assignments-srv)


;//! \htmlinclude MissionStatus-request.msg.html

(cl:defclass <MissionStatus-request> (roslisp-msg-protocol:ros-message)
  ((mission_id
    :reader mission_id
    :initarg :mission_id
    :type cl:string
    :initform "")
   (success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass MissionStatus-request (<MissionStatus-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MissionStatus-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MissionStatus-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignments-srv:<MissionStatus-request> is deprecated: use assignments-srv:MissionStatus-request instead.")))

(cl:ensure-generic-function 'mission_id-val :lambda-list '(m))
(cl:defmethod mission_id-val ((m <MissionStatus-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:mission_id-val is deprecated.  Use assignments-srv:mission_id instead.")
  (mission_id m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <MissionStatus-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:success-val is deprecated.  Use assignments-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MissionStatus-request>) ostream)
  "Serializes a message object of type '<MissionStatus-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'mission_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'mission_id))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MissionStatus-request>) istream)
  "Deserializes a message object of type '<MissionStatus-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mission_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'mission_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MissionStatus-request>)))
  "Returns string type for a service object of type '<MissionStatus-request>"
  "assignments/MissionStatusRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MissionStatus-request)))
  "Returns string type for a service object of type 'MissionStatus-request"
  "assignments/MissionStatusRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MissionStatus-request>)))
  "Returns md5sum for a message object of type '<MissionStatus-request>"
  "8473414d924f983938aed34e90fbc692")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MissionStatus-request)))
  "Returns md5sum for a message object of type 'MissionStatus-request"
  "8473414d924f983938aed34e90fbc692")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MissionStatus-request>)))
  "Returns full string definition for message of type '<MissionStatus-request>"
  (cl:format cl:nil "# Request: Information about the status of the mission.~%string mission_id~%bool success  # If the mission is successfully completed.~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MissionStatus-request)))
  "Returns full string definition for message of type 'MissionStatus-request"
  (cl:format cl:nil "# Request: Information about the status of the mission.~%string mission_id~%bool success  # If the mission is successfully completed.~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MissionStatus-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'mission_id))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MissionStatus-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MissionStatus-request
    (cl:cons ':mission_id (mission_id msg))
    (cl:cons ':success (success msg))
))
;//! \htmlinclude MissionStatus-response.msg.html

(cl:defclass <MissionStatus-response> (roslisp-msg-protocol:ros-message)
  ((mission_complete
    :reader mission_complete
    :initarg :mission_complete
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass MissionStatus-response (<MissionStatus-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MissionStatus-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MissionStatus-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignments-srv:<MissionStatus-response> is deprecated: use assignments-srv:MissionStatus-response instead.")))

(cl:ensure-generic-function 'mission_complete-val :lambda-list '(m))
(cl:defmethod mission_complete-val ((m <MissionStatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:mission_complete-val is deprecated.  Use assignments-srv:mission_complete instead.")
  (mission_complete m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <MissionStatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:message-val is deprecated.  Use assignments-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MissionStatus-response>) ostream)
  "Serializes a message object of type '<MissionStatus-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'mission_complete) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MissionStatus-response>) istream)
  "Deserializes a message object of type '<MissionStatus-response>"
    (cl:setf (cl:slot-value msg 'mission_complete) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MissionStatus-response>)))
  "Returns string type for a service object of type '<MissionStatus-response>"
  "assignments/MissionStatusResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MissionStatus-response)))
  "Returns string type for a service object of type 'MissionStatus-response"
  "assignments/MissionStatusResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MissionStatus-response>)))
  "Returns md5sum for a message object of type '<MissionStatus-response>"
  "8473414d924f983938aed34e90fbc692")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MissionStatus-response)))
  "Returns md5sum for a message object of type 'MissionStatus-response"
  "8473414d924f983938aed34e90fbc692")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MissionStatus-response>)))
  "Returns full string definition for message of type '<MissionStatus-response>"
  (cl:format cl:nil "# Response: Confirmation of mission status.~%bool mission_complete  # Whether the mission is completed successfully.~%string message  # Additional message about the mission, e.g., \"Mission completed successfully.\"~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MissionStatus-response)))
  "Returns full string definition for message of type 'MissionStatus-response"
  (cl:format cl:nil "# Response: Confirmation of mission status.~%bool mission_complete  # Whether the mission is completed successfully.~%string message  # Additional message about the mission, e.g., \"Mission completed successfully.\"~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MissionStatus-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MissionStatus-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MissionStatus-response
    (cl:cons ':mission_complete (mission_complete msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MissionStatus)))
  'MissionStatus-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MissionStatus)))
  'MissionStatus-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MissionStatus)))
  "Returns string type for a service object of type '<MissionStatus>"
  "assignments/MissionStatus")