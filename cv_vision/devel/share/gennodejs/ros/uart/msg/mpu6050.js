// Auto-generated. Do not edit!

// (in-package uart.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class mpu6050 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ax = null;
      this.ay = null;
      this.az = null;
      this.gx = null;
      this.gy = null;
      this.gz = null;
    }
    else {
      if (initObj.hasOwnProperty('ax')) {
        this.ax = initObj.ax
      }
      else {
        this.ax = 0;
      }
      if (initObj.hasOwnProperty('ay')) {
        this.ay = initObj.ay
      }
      else {
        this.ay = 0;
      }
      if (initObj.hasOwnProperty('az')) {
        this.az = initObj.az
      }
      else {
        this.az = 0;
      }
      if (initObj.hasOwnProperty('gx')) {
        this.gx = initObj.gx
      }
      else {
        this.gx = 0;
      }
      if (initObj.hasOwnProperty('gy')) {
        this.gy = initObj.gy
      }
      else {
        this.gy = 0;
      }
      if (initObj.hasOwnProperty('gz')) {
        this.gz = initObj.gz
      }
      else {
        this.gz = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mpu6050
    // Serialize message field [ax]
    bufferOffset = _serializer.int16(obj.ax, buffer, bufferOffset);
    // Serialize message field [ay]
    bufferOffset = _serializer.int16(obj.ay, buffer, bufferOffset);
    // Serialize message field [az]
    bufferOffset = _serializer.int16(obj.az, buffer, bufferOffset);
    // Serialize message field [gx]
    bufferOffset = _serializer.int16(obj.gx, buffer, bufferOffset);
    // Serialize message field [gy]
    bufferOffset = _serializer.int16(obj.gy, buffer, bufferOffset);
    // Serialize message field [gz]
    bufferOffset = _serializer.int16(obj.gz, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mpu6050
    let len;
    let data = new mpu6050(null);
    // Deserialize message field [ax]
    data.ax = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [ay]
    data.ay = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [az]
    data.az = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [gx]
    data.gx = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [gy]
    data.gy = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [gz]
    data.gz = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'uart/mpu6050';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ee542a682aee2ad96063f7f4b66160ba';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 ax
    int16 ay
    int16 az
    int16 gx
    int16 gy
    int16 gz
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new mpu6050(null);
    if (msg.ax !== undefined) {
      resolved.ax = msg.ax;
    }
    else {
      resolved.ax = 0
    }

    if (msg.ay !== undefined) {
      resolved.ay = msg.ay;
    }
    else {
      resolved.ay = 0
    }

    if (msg.az !== undefined) {
      resolved.az = msg.az;
    }
    else {
      resolved.az = 0
    }

    if (msg.gx !== undefined) {
      resolved.gx = msg.gx;
    }
    else {
      resolved.gx = 0
    }

    if (msg.gy !== undefined) {
      resolved.gy = msg.gy;
    }
    else {
      resolved.gy = 0
    }

    if (msg.gz !== undefined) {
      resolved.gz = msg.gz;
    }
    else {
      resolved.gz = 0
    }

    return resolved;
    }
};

module.exports = mpu6050;
