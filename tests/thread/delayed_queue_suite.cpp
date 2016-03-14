#include <fas/testing.hpp>
#include <iow/thread/delayed_queue.hpp>
#include <chrono>
#include <atomic>
#include <thread>
#include <cmath>
#include <condition_variable>

#include "delayed_common_suite.hpp"

UNIT(delayed_queue1, "")
{
  ::iow::queue_options opt;
  ::iow::delayed_queue dq(opt);
  delayed_unit1(t, dq);
}


UNIT(delayed_queue2, "")
{
  ::iow::queue_options opt;
  ::iow::delayed_queue dq(opt);
  delayed_unit2(t, dq);
}

UNIT(delayed_queue3, "")
{
  ::iow::queue_options opt;
  ::iow::delayed_queue dq(opt);
  delayed_unit3(t, dq);
}

UNIT(delayed_queue4, "")
{
  ::iow::queue_options opt;
  ::iow::delayed_queue dq(opt);
  delayed_unit4(t, dq);
}

BEGIN_SUITE(delayed_queue, "")
  ADD_UNIT(delayed_queue1)
  ADD_UNIT(delayed_queue2)
  ADD_UNIT(delayed_queue3)
  ADD_UNIT(delayed_queue4)
END_SUITE(delayed_queue)

