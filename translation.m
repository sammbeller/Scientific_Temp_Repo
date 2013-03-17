function [result_vector] = translation(target_int)
%This function takes in a signed 24-bit int representing the amplitude of a
%sample from an audio file, and converts it into three unsigned 8-bit
%ints representing the red, green, and blue values of a pixel

	if (target_int < 0)
		add = 1;
		target_int = target_int * -1;
	else 
		add = 0;
	end
	
	low_value = mod(target_int, (2^8));
	mid_value = (mod(target_int, (2^16)) - low_value)/(2^8);
	high_value = (target_int - ((mid_value * (2^8)) + low_value))/(2^16);
	high_value = high_value * 2;
	high_value = high_value + add;

	result_vector = uint8([high_value, mid_value, low_value]);
end

