// Generated by gencpp from file apdriver/control.msg
// DO NOT EDIT!


#ifndef APDRIVER_MESSAGE_CONTROL_H
#define APDRIVER_MESSAGE_CONTROL_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace apdriver
{
template <class ContainerAllocator>
struct control_
{
  typedef control_<ContainerAllocator> Type;

  control_()
    : pit(0)
    , rol(0)
    , thr(0)
    , yaw(0)  {
    }
  control_(const ContainerAllocator& _alloc)
    : pit(0)
    , rol(0)
    , thr(0)
    , yaw(0)  {
  (void)_alloc;
    }



   typedef int16_t _pit_type;
  _pit_type pit;

   typedef int16_t _rol_type;
  _rol_type rol;

   typedef int16_t _thr_type;
  _thr_type thr;

   typedef int16_t _yaw_type;
  _yaw_type yaw;




  typedef boost::shared_ptr< ::apdriver::control_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::apdriver::control_<ContainerAllocator> const> ConstPtr;

}; // struct control_

typedef ::apdriver::control_<std::allocator<void> > control;

typedef boost::shared_ptr< ::apdriver::control > controlPtr;
typedef boost::shared_ptr< ::apdriver::control const> controlConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::apdriver::control_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::apdriver::control_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace apdriver

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'apdriver': ['/home/odroid/cv_vision/src/apdriver/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::apdriver::control_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::apdriver::control_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::apdriver::control_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::apdriver::control_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::apdriver::control_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::apdriver::control_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::apdriver::control_<ContainerAllocator> >
{
  static const char* value()
  {
    return "38cad1b120b5b9dad758ac9821bfccf0";
  }

  static const char* value(const ::apdriver::control_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x38cad1b120b5b9daULL;
  static const uint64_t static_value2 = 0xd758ac9821bfccf0ULL;
};

template<class ContainerAllocator>
struct DataType< ::apdriver::control_<ContainerAllocator> >
{
  static const char* value()
  {
    return "apdriver/control";
  }

  static const char* value(const ::apdriver::control_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::apdriver::control_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int16 pit\n\
int16 rol\n\
int16 thr\n\
int16 yaw\n\
";
  }

  static const char* value(const ::apdriver::control_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::apdriver::control_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.pit);
      stream.next(m.rol);
      stream.next(m.thr);
      stream.next(m.yaw);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct control_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::apdriver::control_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::apdriver::control_<ContainerAllocator>& v)
  {
    s << indent << "pit: ";
    Printer<int16_t>::stream(s, indent + "  ", v.pit);
    s << indent << "rol: ";
    Printer<int16_t>::stream(s, indent + "  ", v.rol);
    s << indent << "thr: ";
    Printer<int16_t>::stream(s, indent + "  ", v.thr);
    s << indent << "yaw: ";
    Printer<int16_t>::stream(s, indent + "  ", v.yaw);
  }
};

} // namespace message_operations
} // namespace ros

#endif // APDRIVER_MESSAGE_CONTROL_H