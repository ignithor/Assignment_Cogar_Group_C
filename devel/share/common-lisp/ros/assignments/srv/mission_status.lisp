; Auto-generated. Do not edit!


(cl:in-package assignments-srv)


;//! \htmlinclude mission_status-request.msg.html

(cl:defclass <mission_status-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass mission_status-request (<mission_status-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mission_status-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mission_status-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignments-srv:<mission_status-request> is deprecated: use assignments-srv:mission_status-request instead.")))

(cl:ensure-generic-function 'mission_id-val :lambda-list '(m))
(cl:defmethod mission_id-val ((m <mission_status-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:mission_id-val is deprecated.  Use assignments-srv:mission_id instead.")
  (mission_id m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <mission_status-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:success-val is deprecated.  Use assignments-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mission_status-request>) ostream)
  "Serializes a message object of type '<mission_status-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'mission_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'mission_id))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mission_status-request>) istream)
  "Deserializes a message object of type '<mission_status-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mission_status-request>)))
  "Returns string type for a service object of type '<mission_status-request>"
  "assignments/mission_statusRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mission_status-request)))
  "Returns string type for a service object of type 'mission_status-request"
  "assignments/mission_statusRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mission_status-request>)))
  "Returns md5sum for a message object of type '<mission_status-request>"
  "8473414d924f983938aed34e90fbc692")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mission_status-request)))
  "Returns md5sum for a message object of type 'mission_status-request"
  "8473414d924f983938aed34e90fbc692")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mission_status-request>)))
  "Returns full string definition for message of type '<mission_status-request>"
  (cl:format cl:nil "# Request: Information about the status of the mission.~%string mission_id~%bool success  # If the mission is successfully completed.~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mission_status-request)))
  "Returns full string definition for message of type 'mission_status-request"
  (cl:format cl:nil "# Request: Information about the status of the mission.~%string mission_id~%bool success  # If the mission is successfully completed.~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mission_status-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'mission_id))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mission_status-request>))
  "Converts a ROS message object to a list"
  (cl:list 'mission_status-request
    (cl:cons ':mission_id (mission_id msg))
    (cl:cons ':success (success msg))
))
;//! \htmlinclude mission_status-response.msg.html

(cl:defclass <mission_status-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass mission_status-response (<mission_status-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mission_status-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mission_status-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignments-srv:<mission_status-response> is deprecated: use assignments-srv:mission_status-response instead.")))

(cl:ensure-generic-function 'mission_complete-val :lambda-list '(m))
(cl:defmethod mission_complete-val ((m <mission_status-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:mission_complete-val is deprecated.  Use assignments-srv:mission_complete instead.")
  (mission_complete m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <mission_status-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:message-val is deprecated.  Use assignments-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mission_status-response>) ostream)
  "Serializes a message object of type '<mission_status-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'mission_complete) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mission_status-response>) istream)
  "Deserializes a message object of type '<mission_status-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mission_status-response>)))
  "Returns string type for a service object of type '<mission_status-response>"
  "assignments/mission_statusResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mission_status-response)))
  "Returns string type for a service object of type 'mission_status-response"
  "assignments/mission_statusResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mission_status-response>)))
  "Returns md5sum for a message object of type '<mission_status-response>"
  "8473414d924f983938aed34e90fbc692")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mission_status-response)))
  "Returns md5sum for a message object of type 'mission_status-response"
  "8473414d924f983938aed34e90fbc692")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mission_status-response>)))
  "Returns full string definition for message of type '<mission_status-response>"
  (cl:format cl:nil "# Response: Confirmation of mission status.~%bool mission_complete  # Whether the mission is completed successfully.~%string message  # Additional message about the mission, e.g., \"Mission completed successfully.\"~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mission_status-response)))
  "Returns full string definition for message of type 'mission_status-response"
  (cl:format cl:nil "# Response: Confirmation of mission status.~%bool mission_complete  # Whether the mission is completed successfully.~%string message  # Additional message about the mission, e.g., \"Mission completed successfully.\"~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mission_status-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mission_status-response>))
  "Converts a ROS message object to a list"
  (cl:list 'mission_status-response
    (cl:cons ':mission_complete (mission_complete msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'mission_status)))
  'mission_status-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'mission_status)))
  'mission_status-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mission_status)))
  "Returns string type for a service object of type '<mission_status>"
  "assignments/mission_status")