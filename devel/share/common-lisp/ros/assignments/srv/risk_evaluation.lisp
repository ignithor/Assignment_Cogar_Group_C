; Auto-generated. Do not edit!


(cl:in-package assignments-srv)


;//! \htmlinclude risk_evaluation-request.msg.html

(cl:defclass <risk_evaluation-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (hazard_type
    :reader hazard_type
    :initarg :hazard_type
    :type cl:string
    :initform ""))
)

(cl:defclass risk_evaluation-request (<risk_evaluation-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <risk_evaluation-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'risk_evaluation-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignments-srv:<risk_evaluation-request> is deprecated: use assignments-srv:risk_evaluation-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <risk_evaluation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:x-val is deprecated.  Use assignments-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <risk_evaluation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:y-val is deprecated.  Use assignments-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <risk_evaluation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:z-val is deprecated.  Use assignments-srv:z instead.")
  (z m))

(cl:ensure-generic-function 'hazard_type-val :lambda-list '(m))
(cl:defmethod hazard_type-val ((m <risk_evaluation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:hazard_type-val is deprecated.  Use assignments-srv:hazard_type instead.")
  (hazard_type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <risk_evaluation-request>) ostream)
  "Serializes a message object of type '<risk_evaluation-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'hazard_type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'hazard_type))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <risk_evaluation-request>) istream)
  "Deserializes a message object of type '<risk_evaluation-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'hazard_type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'hazard_type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<risk_evaluation-request>)))
  "Returns string type for a service object of type '<risk_evaluation-request>"
  "assignments/risk_evaluationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'risk_evaluation-request)))
  "Returns string type for a service object of type 'risk_evaluation-request"
  "assignments/risk_evaluationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<risk_evaluation-request>)))
  "Returns md5sum for a message object of type '<risk_evaluation-request>"
  "2ad8d9fb9c81a63740c12dbd83c357d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'risk_evaluation-request)))
  "Returns md5sum for a message object of type 'risk_evaluation-request"
  "2ad8d9fb9c81a63740c12dbd83c357d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<risk_evaluation-request>)))
  "Returns full string definition for message of type '<risk_evaluation-request>"
  (cl:format cl:nil "# RiskEvaluation.srv~%float64 x~%float64 y~%float64 z~%string hazard_type   # E.g., \"crack\", \"unstable_section\", etc. ~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'risk_evaluation-request)))
  "Returns full string definition for message of type 'risk_evaluation-request"
  (cl:format cl:nil "# RiskEvaluation.srv~%float64 x~%float64 y~%float64 z~%string hazard_type   # E.g., \"crack\", \"unstable_section\", etc. ~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <risk_evaluation-request>))
  (cl:+ 0
     8
     8
     8
     4 (cl:length (cl:slot-value msg 'hazard_type))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <risk_evaluation-request>))
  "Converts a ROS message object to a list"
  (cl:list 'risk_evaluation-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':hazard_type (hazard_type msg))
))
;//! \htmlinclude risk_evaluation-response.msg.html

(cl:defclass <risk_evaluation-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass risk_evaluation-response (<risk_evaluation-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <risk_evaluation-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'risk_evaluation-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignments-srv:<risk_evaluation-response> is deprecated: use assignments-srv:risk_evaluation-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <risk_evaluation-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:success-val is deprecated.  Use assignments-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <risk_evaluation-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:message-val is deprecated.  Use assignments-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <risk_evaluation-response>) ostream)
  "Serializes a message object of type '<risk_evaluation-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <risk_evaluation-response>) istream)
  "Deserializes a message object of type '<risk_evaluation-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<risk_evaluation-response>)))
  "Returns string type for a service object of type '<risk_evaluation-response>"
  "assignments/risk_evaluationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'risk_evaluation-response)))
  "Returns string type for a service object of type 'risk_evaluation-response"
  "assignments/risk_evaluationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<risk_evaluation-response>)))
  "Returns md5sum for a message object of type '<risk_evaluation-response>"
  "2ad8d9fb9c81a63740c12dbd83c357d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'risk_evaluation-response)))
  "Returns md5sum for a message object of type 'risk_evaluation-response"
  "2ad8d9fb9c81a63740c12dbd83c357d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<risk_evaluation-response>)))
  "Returns full string definition for message of type '<risk_evaluation-response>"
  (cl:format cl:nil "bool success~%string message  # Additional message, e.g., \"Moving to a safer distance.\"~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'risk_evaluation-response)))
  "Returns full string definition for message of type 'risk_evaluation-response"
  (cl:format cl:nil "bool success~%string message  # Additional message, e.g., \"Moving to a safer distance.\"~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <risk_evaluation-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <risk_evaluation-response>))
  "Converts a ROS message object to a list"
  (cl:list 'risk_evaluation-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'risk_evaluation)))
  'risk_evaluation-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'risk_evaluation)))
  'risk_evaluation-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'risk_evaluation)))
  "Returns string type for a service object of type '<risk_evaluation>"
  "assignments/risk_evaluation")