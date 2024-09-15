import QtQuick 2.12
import QtQuick.Window 2.13
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0
import QtCharts 2.1


Window {
	id : root
	width: 1000
	maximumWidth : width
	minimumWidth : width
    height: 650
	maximumHeight : height
	minimumHeight : height
	title:"REFURBISH INVERTED PENDULUM"
	color : "#000212"
    visible: true
    flags: Qt.Dialog
	
	
	Rectangle{
	x : 700
	width : 250
	height : 110
	color : "transparent"
	border.color : "#df1c39"
	border.width : 3
	
	ComboBox {
		id : cb1
		x : 10
		y : 10

	}
	
	Button {
		id: connect
		x :10
		y :60
		width : 140
		text: connect.checked? "connect" : "disconnect"
		font.pixelSize : 20
		checkable : true
		visible : true
		
		Rectangle{
			width : parent.width
			height: parent.height
			color : connect.checked ? "#04f8fa" : "#df1c39"
		}
		
		onClicked:{
		backend.connection(connect.text, cb1.currentText)
		
		}
		
		}
		
	Image{
	x : 160
	anchors.verticalCenter: parent.verticalCenter
	width : 75
	height : 75
	source : "electronics.png"
	}
	
	}
	
	
	
	
	

	


	Rectangle{
		x: 10
		y: 150
		width: 400
		height:400
		color: "#122e55"
	
		Text{
			x:0
			y:0
			text:"INDICATOR"
			font.pixelSize:30
			color: "white"
		}
		
		
		Text{
			x:0
			y:55
			text:"LED 1 :"
			font.pixelSize:22
			color: "white"
		}
		
		
		Button {
		id: button1
		x :120
		y :50
		width : 50
		text: "off"
		font.pixelSize : 20
		
		Rectangle{
			id:button1_color
			width : parent.width
			height: parent.height
			color:"#df1c39"
		}
		
		
		palette {
      		button: "transparent"
			buttonText: "black"
		}
		
		onClicked:{
			if(button1.text == "on"){
				text = "off";
				button1_color.color = "#df1c39"
				backend.button1("0")
				
			}else
				if(button1.text == "off"){
				text = "on";
				button1_color.color = "#04f8fa" 
				backend.button1("1")
				}
		}
			
			
	}
	
		
		Text{
			x:0
			y:115
			text:"LED 2 :"
			font.pixelSize:22
			color: "white"
		}
		
		
		Button {
			id: button2
			x :120
			y :110
			width : 50
			text: "off"
			font.pixelSize : 20
		
		Rectangle{
			id:button2_color
			width : parent.width
			height: parent.height
			color:"#df1c39"
		}
		
		
		palette {
      		button: "transparent"
			buttonText: "black"
		}
		
		onClicked:{
			if(button2.text == "on"){
				text = "off";
				button2_color.color = "#df1c39"
				backend.button2("0")
				
				
			}else
				if(button2.text == "off"){
				text = "on";
				button2_color.color = "#04f8fa" 
				backend.button2("1")
				}
		}
		
		
		
		
			
	}
	
	
		Text{
			x:0
			y:175
			text:"LED 3 :"
			font.pixelSize:22
			color: "white"
		}
		
		
		Button {
			id: button3
			x :120
			y :170
			width : 50
			text: "off"
			font.pixelSize : 20
		
		Rectangle{
			id:button3_color
			width : parent.width
			height: parent.height
			color:"#df1c39"
		}
		
		
		palette {
      		button: "transparent"
			buttonText: "black"
		}
		
		onClicked:{
			if(button3.text == "on"){
				text = "off";
				button3_color.color = "#df1c39"
				backend.button3("0")
				
			}else
				if(button3.text == "off"){
				text = "on";
				button3_color.color = "#04f8fa" 
				backend.button3("1")
				}
		}
			
			
	}
	
	
	Rectangle{
			id:sensor1_color
			x: 20
			y:250
			width : 75
			height: 75
			color: backend.get_input1_color()
			
			Image{
			width : parent.width
			height : parent.height
			source:"sensor.png"
			}
			Text {
			anchors.horizontalCenter: parent.horizontalCenter
			y: 80
			text : "SWITCH 1"
			color : "white"
			font.pixelSize : 15
			}
			
		}
	
	
	Rectangle{
			id:sensor2_color
			x: 130
			y:250
			width : 75
			height: 75
			color:backend.get_input2_color()
			
			Image{
			width : parent.width
			height : parent.height
			source:"sensor.png"
			}
			
			Text {
			anchors.horizontalCenter: parent.horizontalCenter
			y: 80
			text : "SWITCH 2"
			color : "white"
			font.pixelSize : 15
			}
			
		}
	
	
	
	
	Slider {
		id: slider1
		x:0
		y:360
		height: 20
		width: 300
		value: 0
		from:0
		to: 255
		stepSize: 1
		orientation: Qt.Horizontal
		onValueChanged: {
		backend.analog_output(value)
		
		}
		
		Text {
			x : 310
			y: 5
			text : slider1.value 
			color : "white"
			font.pixelSize : 15
			}
	
	}
	
	
	
	
	Gauge {
		id : gauge2
		x: 250
		y: 20
		height : 270
		width : 150
		minimumValue: 0
		tickmarkStepSize: 205
		value: pot_val.text
		maximumValue: 1023
		
		
		style: GaugeStyle {
			
			valueBar: Rectangle {
				antialiasing: true
				color: "#04f8fa"
				implicitWidth: 70
			}	
		
		}
		
		Text{
		id : pot_val
		anchors.horizontalCenter: parent.horizontalCenter
		y:270 
		font.pixelSize:33
		color :"white"
	}
		
	}
	
	
	
	
	
	}
	
	

	
	Rectangle{
		x: 450
		y: 150
		width: 500
		height:400
		color: "#122e55"
	
		Text{
			anchors.horizontalCenter: parent.horizontalCenter
			y:0
			text:"CHART"
			font.pixelSize:24
			color: "white"
		}
		
		Rectangle {
                    id: rect_payout_2
                    x: 0
                    y: 0
                    width: parent.width
                    height: parent.height
					color:"transparent"
					
					ChartView {
						id : cv
						//title: "PAYOUT ROPE"
						antialiasing: true
						legend.visible: false
						height: parent.height
						anchors.right: parent.right
						anchors.left: parent.left
						//theme: ChartView.ChartThemeLight
						backgroundColor:"transparent"
						property int  timcnt: 0
						property double  valueCH1: 0
						property double  valueCH2: 0
						property double  valueCH3: 0
						property double  valueCH4: 0
						//property double  valueTM1: 0        
						property double  periodGRAPH: 100 // milisecond
						property double  startTIME: 0
						property double  intervalTM: 200 // miliseconds
						
						
						ValueAxis{
						id:yAxis1
						min: 0
						max: cv.valueCH1 < 500 ? 500 : (cv.valueCH1 + 3)
						tickCount: 1
						//labelFormat: "%d"
						labelsColor: "yellow"
					}
						
						
						LineSeries {
						//name: "LineSeries"
						name: "AIN 0"
						id:lines1
						width: 4
						color: "yellow"
						axisY: yAxis1
						axisX: 	DateTimeAxis {
							id: eje4
							labelsColor: "yellow"
							//format: "yyyy MMM"
							format:"HH:mm:ss.z"
							//format:"mm:ss.z"
							
						
						}
					}
						
				}
			}
			
	
	Timer{
			id:tm
			interval: cv.intervalTM
			repeat: true
			running: true
			onTriggered: {
				cv.timcnt = cv.timcnt + 1
				cv.valueCH1 = pot_val.text//Math.random() * 5
				
				if (lines1.count>cv.periodGRAPH*100/cv.intervalTM){
					lines1.remove(0)
					
					}
				
				lines1.append(cv.startTIME+cv.timcnt*cv.intervalTM ,cv.valueCH1)
				lines1.axisX.min = new Date(cv.startTIME-cv.periodGRAPH*100 + cv.timcnt*cv.intervalTM)
				lines1.axisX.max = new Date(cv.startTIME + cv.timcnt*cv.intervalTM)
				
				}
	  
			}
		
		
	
	
	
	Component.onCompleted: {
		cv.startTIME = backend.get_tiempo()*1000
	}
	
		
	
	}
	
	
	
	
	
	Text{
	id : holding_register
	x:10
	y:600
	text:"Holding Register val: 40000 |40001| 40002 | 40003 | 40004 | 40005 "
	font.pixelSize:20
	color :"#04f8fa"
	}
	
	Timer{
		id:tmgauge
		interval: 50
		repeat: true
		running: true
		onTriggered: {
		pot_val.text = backend.get_analog()
		sensor1_color.color = backend.get_input1_color()
		sensor2_color.color = backend.get_input2_color()
		holding_register.text = "Holding Register value : " + backend.get_holding_register()
		
		cb1.model = backend.port_val_read()
		}
	}
	
}













