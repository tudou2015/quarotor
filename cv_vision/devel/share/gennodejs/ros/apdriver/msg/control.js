// Auto-generated. Do not edit!

// (in-package apdriver.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class control {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pit = null;
      this.rol = null;
      this.thr = null;
      this.yaw = null;
    }
    else {
      if (initObj.hasOwnProperty('pit')) {
        this.pit = initObj.pit
      }
      else {
        this.pit = 0;
      }
      if (initObj.hasOwnProperty('rol')) {
        this.rol = initObj.rol
      }
      else {
        this.rol = 0;
      }
      if (initObj.hasOwnProperty('thr')) {
        this.thr = initObj.thr
      }
      else {
        this.thr = 0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type control
    // Serialize message field [pit]
    bufferOffset = _serializer.int16(obj.pit, buffer, bufferOffset);
    // Serialize message field [rol]
    bufferOffset = _serializer.int16(obj.rol, buffer, bufferOffset);
    // Serialize message field [thr]
    bufferOffset = _serializer.int16(obj.thr, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.int16(obj.yaw, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type control
    let len;
    let data = new control(null);
    // Deserialize message field [pit]
    data.pit = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [rol]
    data.rol = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [thr]
    data.thr = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'apdriver/control';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '38cad1b120b5b9dad758ac9821bfccf0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 pit
    int16 rol
    int16 thr
    int16 yaw
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new control(null);
    if (msg.pit !== undefined) {
      resolved.pit = msg.pit;
    }
    else {
      resolved.pit = 0
    }

    if (msg.rol !== undefined) {
      resolved.rol = msg.rol;
    }
    else {
      resolved.rol = 0
    }

    if (msg.thr !== undefined) {
      resolved.thr = msg.thr;
    }
    else {
      resolved.thr = 0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0
    }

    return resolved;
    }
};

module.exports = control;
