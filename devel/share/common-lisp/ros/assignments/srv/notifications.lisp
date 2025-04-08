; Auto-generated. Do not edit!


(cl:in-package assignments-srv)


;//! \htmlinclude notifications-request.msg.html

(cl:defclass <notifications-request> (roslisp-msg-protocol:ros-message)
  ((plate_name
    :reader plate_name
    :initarg :plate_name
    :type cl:string
    :initform "")
   (table_number
    :reader table_number
    :initarg :table_number
    :type cl:string
    :initform ""))
)

(cl:defclass notifications-request (<notifications-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <notifications-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'notifications-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignments-srv:<notifications-request> is deprecated: use assignments-srv:notifications-request instead.")))

(cl:ensure-generic-function 'plate_name-val :lambda-list '(m))
(cl:defmethod plate_name-val ((m <notifications-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:plate_name-val is deprecated.  Use assignments-srv:plate_name instead.")
  (plate_name m))

(cl:ensure-generic-function 'table_number-val :lambda-list '(m))
(cl:defmethod table_number-val ((m <notifications-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:table_number-val is deprecated.  Use assignments-srv:table_number instead.")
  (table_number m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <notifications-request>) ostream)
  "Serializes a message object of type '<notifications-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'plate_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'plate_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'table_number))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'table_number))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <notifications-request>) istream)
  "Deserializes a message object of type '<notifications-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'plate_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'plate_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'table_number) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'table_number) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<notifications-request>)))
  "Returns string type for a service object of type '<notifications-request>"
  "assignments/notificationsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'notifications-request)))
  "Returns string type for a service object of type 'notifications-request"
  "assignments/notificationsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<notifications-request>)))
  "Returns md5sum for a message object of type '<notifications-request>"
  "31471cbc5866c6110d0f43de5ac7621e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'notifications-request)))
  "Returns md5sum for a message object of type 'notifications-request"
  "31471cbc5866c6110d0f43de5ac7621e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<notifications-request>)))
  "Returns full string definition for message of type '<notifications-request>"
  (cl:format cl:nil "# Request: The name of the plate that was incorrectly delivered, and the table information.~%string plate_name~%string table_number  # The table where the wrong plate was delivered.~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'notifications-request)))
  "Returns full string definition for message of type 'notifications-request"
  (cl:format cl:nil "# Request: The name of the plate that was incorrectly delivered, and the table information.~%string plate_name~%string table_number  # The table where the wrong plate was delivered.~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <notifications-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'plate_name))
     4 (cl:length (cl:slot-value msg 'table_number))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <notifications-request>))
  "Converts a ROS message object to a list"
  (cl:list 'notifications-request
    (cl:cons ':plate_name (plate_name msg))
    (cl:cons ':table_number (table_number msg))
))
;//! \htmlinclude notifications-response.msg.html

(cl:defclass <notifications-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass notifications-response (<notifications-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <notifications-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'notifications-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignments-srv:<notifications-response> is deprecated: use assignments-srv:notifications-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <notifications-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:success-val is deprecated.  Use assignments-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <notifications-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:message-val is deprecated.  Use assignments-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <notifications-response>) ostream)
  "Serializes a message object of type '<notifications-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <notifications-response>) istream)
  "Deserializes a message object of type '<notifications-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<notifications-response>)))
  "Returns string type for a service object of type '<notifications-response>"
  "assignments/notificationsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'notifications-response)))
  "Returns string type for a service object of type 'notifications-response"
  "assignments/notificationsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<notifications-response>)))
  "Returns md5sum for a message object of type '<notifications-response>"
  "31471cbc5866c6110d0f43de5ac7621e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'notifications-response)))
  "Returns md5sum for a message object of type 'notifications-response"
  "31471cbc5866c6110d0f43de5ac7621e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<notifications-response>)))
  "Returns full string definition for message of type '<notifications-response>"
  (cl:format cl:nil "# Response: Confirmation if the notification was successfully sent.~%bool success~%string message  # A message confirming the notification, e.g., \"Notification sent to staff.\"~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'notifications-response)))
  "Returns full string definition for message of type 'notifications-response"
  (cl:format cl:nil "# Response: Confirmation if the notification was successfully sent.~%bool success~%string message  # A message confirming the notification, e.g., \"Notification sent to staff.\"~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <notifications-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <notifications-response>))
  "Converts a ROS message object to a list"
  (cl:list 'notifications-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'notifications)))
  'notifications-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'notifications)))
  'notifications-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'notifications)))
  "Returns string type for a service object of type '<notifications>"
  "assignments/notifications")