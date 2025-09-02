import motor
import sensor { Sensor }
import time
import task


__global (
	move_mutex = Mutex(0)			// mutex variable
	touch = Sensor.new(sensor.s1)	// sensor variable
)

@[task]
fn move_square() {
	for {
		task.mutex_lock(move_mutex)
		motor_ac.write(75)
		time.sleep_ms(1000)
		motor_c.write(-75)	// reverse
		time.sleep_ms(500)
		task.mutex_unlock(move_mutex)
	}
}

@[task]
fn check_sensors() {
	for {
		if touch.read() == 1 {
			task.mutex_lock(move_mutex)
			motor_ac.write(-75)	// reverse
			time.sleep_ms(500)
			motor_a.write(75)
			time.sleep_ms(500)
			task.mutex_unlock(move_mutex)
		}
	}
}


touch.as_touch()	// configure the sensor as touch
task.priority(move_square, check_sensors)
