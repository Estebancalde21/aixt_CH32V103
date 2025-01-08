// Project name: Aixt, https://github.com/fermarsan/aixt.git
// Author: Fernando M. Santa
// Date: 2024-2025
// License: MIT
//
// Description: Display module for NXT (NXC backend)

module lcd


// cursor variables
__global (
	cursor_x = i8(0)
	cursor_y = i8(56)	
)

const x_max = i8(90)
const y_max = i8(56)

// Line numbers for use with DrawText system function.  
@[as_macro] const line8	= 0    
@[as_macro] const line7	= 8    
@[as_macro] const line6	= 16   
@[as_macro] const line5	= 24   
@[as_macro] const line4	= 32   
@[as_macro] const line3	= 40   
@[as_macro] const line2	= 48   
@[as_macro] const line1	= 56   

// Constants that are for use with getting/setting display data. 
@[as_macro] const textline_1 = 0  
@[as_macro] const textline_2 = 1  
@[as_macro] const textline_3 = 2  
@[as_macro] const textline_4 = 3  
@[as_macro] const textline_5 = 4  
@[as_macro] const textline_6 = 5  
@[as_macro] const textline_7 = 6  
@[as_macro] const textline_8 = 7  
@[as_macro] const textlines  = 8  


@[as_macro] 
pub fn reset() {
	C.ResetScreen() 
}

@[as_macro] 
pub fn circle(x i16, y i16, radius u8) i8 {
	return C.CircleOut(x, y, radius, C.DRAW_OPT_NORMAL) 
}

@[as_macro] 
pub fn line(x1 i16, y1 i16, x2 i16, y2 i16) i8 {
	return C.LineOut(x1, y1, x2, y2, C.DRAW_OPT_NORMAL) 
}

@[as_macro] 
pub fn point(x i16, y i16) i8 {
	return C.PointOut(x, y, C.DRAW_OPT_NORMAL) 
}

@[as_macro] 
pub fn rect(x i16, y i16, width i16, height i16) i8 {
	return C.RectOut(x, y, width, height, C.DRAW_OPT_NORMAL) 
}

@[as_macro] 
pub fn write_text(x i16, y i16, str string) i8 {
	return C.TextOut(x, y, str, C.DRAW_OPT_NORMAL) 
}

@[as_macro] 
pub fn write_num(x i16, y i16, value any) i8 {
	return C.NumOut(x, y, value, C.DRAW_OPT_NORMAL) 
}

@[as_macro] 
pub fn ellipse(x i16, y i16, radius_x u8, radius_y u8) i8 {
	return C.EllipseOut(x, y, radius_x, radius_y, C.DRAW_OPT_NORMAL) 
}

@[as_macro] 
pub fn read_contrast() u8 {
	return C.DisplayContrast() 
}

@[as_macro] 
pub fn setup_contrast(contrast u8) {
	return C.SetDisplayContrast(contrast) 
}

@[as_macro] 
pub fn clear() {
	C.ClearScreen()
	cursor_x = 0
	cursor_y = 56
}

@[as_macro] 
pub fn clear_line(line u8) {
	return C.ClearLine(line) 
}

pub fn into_range(num i8, max i8, min i8) i8 {
	if num > max {
		return max
	}
	else if num < min {
		return min
	}
	else {
		return num
	}
}

pub fn move_to(x i8, y i8) {
	cursor_x = lcd.into_range(x*6, x_max, 0)
	cursor_y = lcd.into_range(56-(y*8), y_max, 0)
}

pub fn print(msg string) {
	lcd.write_text(cursor_x, cursor_y, msg)
	cursor_x += C.StrLen(msg)*6
	cursor_x = lcd.into_range(cursor_x, x_max, 0)
}


pub fn println(msg string) {
	lcd.print(msg)
	cursor_y -= 8
	cursor_y = lcd.into_range(cursor_y, y_max, 0)
	cursor_x = 0
}
