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

class mission_statusRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mission_id = null;
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('mission_id')) {
        this.mission_id = initObj.mission_id
      }
      else {
        this.mission_id = '';
      }
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mission_statusRequest
    // Serialize message field [mission_id]
    bufferOffset = _serializer.string(obj.mission_id, buffer, bufferOffset);
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mission_statusRequest
    let len;
    let data = new mission_statusRequest(null);
    // Deserialize message field [mission_id]
    data.mission_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.mission_id);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignments/mission_statusRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c20f36d179e811bb0acd97de1ab9246a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Request: Information about the status of the mission.
    string mission_id
    bool success  # If the mission is successfully completed.
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new mission_statusRequest(null);
    if (msg.mission_id !== undefined) {
      resolved.mission_id = msg.mission_id;
    }
    else {
      resolved.mission_id = ''
    }

    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

class mission_statusResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mission_complete = null;
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('mission_complete')) {
        this.mission_complete = initObj.mission_complete
      }
      else {
        this.mission_complete = false;
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mission_statusResponse
    // Serialize message field [mission_complete]
    bufferOffset = _serializer.bool(obj.mission_complete, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mission_statusResponse
    let len;
    let data = new mission_statusResponse(null);
    // Deserialize message field [mission_complete]
    data.mission_complete = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.message);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignments/mission_statusResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a6469b1a790f365f804bd4f1a739016d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Response: Confirmation of mission status.
    bool mission_complete  # Whether the mission is completed successfully.
    string message  # Additional message about the mission, e.g., "Mission completed successfully."
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new mission_statusResponse(null);
    if (msg.mission_complete !== undefined) {
      resolved.mission_complete = msg.mission_complete;
    }
    else {
      resolved.mission_complete = false
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: mission_statusRequest,
  Response: mission_statusResponse,
  md5sum() { return '8473414d924f983938aed34e90fbc692'; },
  datatype() { return 'assignments/mission_status'; }
};
