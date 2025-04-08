// Auto-generated. Do not edit!

// (in-package assignments.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class CheckJointStateRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.positions = null;
      this.velocities = null;
      this.efforts = null;
    }
    else {
      if (initObj.hasOwnProperty('positions')) {
        this.positions = initObj.positions
      }
      else {
        this.positions = [];
      }
      if (initObj.hasOwnProperty('velocities')) {
        this.velocities = initObj.velocities
      }
      else {
        this.velocities = [];
      }
      if (initObj.hasOwnProperty('efforts')) {
        this.efforts = initObj.efforts
      }
      else {
        this.efforts = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CheckJointStateRequest
    // Serialize message field [positions]
    bufferOffset = _arraySerializer.float64(obj.positions, buffer, bufferOffset, null);
    // Serialize message field [velocities]
    bufferOffset = _arraySerializer.float64(obj.velocities, buffer, bufferOffset, null);
    // Serialize message field [efforts]
    bufferOffset = _arraySerializer.float64(obj.efforts, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CheckJointStateRequest
    let len;
    let data = new CheckJointStateRequest(null);
    // Deserialize message field [positions]
    data.positions = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [velocities]
    data.velocities = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [efforts]
    data.efforts = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.positions.length;
    length += 8 * object.velocities.length;
    length += 8 * object.efforts.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignments/CheckJointStateRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd9ca0af36daadfa3b4628ccba7ca6819';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Request: a JointState-like structure
    float64[] positions
    float64[] velocities
    float64[] efforts
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CheckJointStateRequest(null);
    if (msg.positions !== undefined) {
      resolved.positions = msg.positions;
    }
    else {
      resolved.positions = []
    }

    if (msg.velocities !== undefined) {
      resolved.velocities = msg.velocities;
    }
    else {
      resolved.velocities = []
    }

    if (msg.efforts !== undefined) {
      resolved.efforts = msg.efforts;
    }
    else {
      resolved.efforts = []
    }

    return resolved;
    }
};

class CheckJointStateResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CheckJointStateResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CheckJointStateResponse
    let len;
    let data = new CheckJointStateResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignments/CheckJointStateResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Response: boolean indicating if the dimensions match
    bool success
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CheckJointStateResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: CheckJointStateRequest,
  Response: CheckJointStateResponse,
  md5sum() { return '92da1e14e4cd448e7306767001ef56ff'; },
  datatype() { return 'assignments/CheckJointState'; }
};
