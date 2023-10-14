func hsva(hue:int,saturation:int,value:int,alpha:int = 100) -> Color:
	return(Color.from_hsv(hue / 360.0,saturation / 100.0,value / 100.0,alpha / 100.0))
