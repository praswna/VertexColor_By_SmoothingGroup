rollout Vcol_by_SG "Vcol by SG" width:173 height:91
(
	spinner 'SG_spn' "" pos:[97,39] width:65 height:16 range:[0,180,20] type:#integer scale:1 align:#left
	button 'smt_gr1' "sg 1" pos:[30,42] width:53 height:16 align:#left
	button 'setBySG_bt' "set SG" pos:[10,6] width:85 height:35 toolTip:"0.001" align:#left
	button 'Vcol' "Vcol on/off" pos:[97,23] width:65 height:16 toolTip:"0.001" align:#left
	button 'clear_Vcol' "clear_Vcol" pos:[97,7] width:65 height:16 align:#left
	checkbutton 'selBySG1' "1" pos:[7,59] width:19 height:12 highlightColor:(color 230 50 50) align:#left
	checkbutton 'selBySG2' "2" pos:[27,59] width:19 height:12 highlightColor:(color 200 200 0) align:#left
	checkbutton 'selBySG3' "3" pos:[47,59] width:19 height:12 highlightColor:(color 120 200 60) align:#left
	checkbutton 'selBySG4' "4" pos:[67,59] width:19 height:12 highlightColor:(color 90 150 230) align:#left
	checkbutton 'selBySG5' "5" pos:[87,59] width:19 height:12 highlightColor:(color 240 150 190) align:#left
	checkbutton 'selBySG6' "6" pos:[107,59] width:19 height:12 highlightColor:(color 145 0 224) align:#left
	checkbutton 'selBySG7' "7" pos:[126,59] width:19 height:12 highlightColor:(color 224 0 224) align:#left
	checkbutton 'selBySG8' "8" pos:[145,59] width:19 height:12 highlightColor:(color 224 224 224) align:#left
	checkbutton 'selBySG9' "9" pos:[7,71] width:19 height:12 highlightColor:(color 124 0 0) align:#left
	checkbutton 'selBySG10' "10" pos:[27,71] width:19 height:12 highlightColor:(color 124 45 0) align:#left
	checkbutton 'selBySG11' "11" pos:[47,71] width:19 height:12 highlightColor:(color 124 124 0) align:#left
	checkbutton 'selBySG12' "12" pos:[67,71] width:19 height:12 highlightColor:(color 145 124 0) align:#left
	checkbutton 'selBySG13' "13" pos:[87,70] width:19 height:12 highlightColor:(color 0 145 124) align:#left
	checkbutton 'selBySG14' "14" pos:[107,71] width:19 height:12 highlightColor:(color 145 0 124) align:#left
	checkbutton 'selBySG15' "15" pos:[126,71] width:19 height:12 highlightColor:(color 124 0 124) align:#left
	checkbutton 'selBySG16' "16" pos:[145,71] width:19 height:12 highlightColor:(color 124 124 124) align:#left


	fn off_state = 
	(
		selBySG1.state = false
		selBySG2.state = false
		selBySG3.state = false
		selBySG4.state = false
		selBySG5.state = false
		selBySG6.state = false
		selBySG7.state = false
		selBySG8.state = false
		selBySG9.state = false
		selBySG10.state = false
		selBySG11.state = false
		selBySG12.state = false
		selBySG13.state = false
		selBySG14.state = false
		selBySG15.state = false
		selBySG16.state = false
	)
	
	fn on_state = 
	(
		selBySG1.state = true
		selBySG2.state = true
		selBySG3.state = true
		selBySG4.state = true
		selBySG5.state = true
		selBySG6.state = true
		selBySG7.state = true
		selBySG8.state = true
		selBySG9.state = true
		selBySG10.state = true
		selBySG11.state = true
		selBySG12.state = true
		selBySG13.state = true
		selBySG14.state = true
		selBySG15.state = true
		selBySG16.state = true
	)

	fn SG_callBack a b= 
	(
		if classOf $ == Editable_Poly then
			(
				j = getFaceSelection selection[1] as array
				
				if j[1] != undefined and j.count != 0 then
				(
					off_state()
					i = polyop.getFaceSmoothGroup $ j[1]
					case i of
					(
						1 : selBySG1.state = true 
						2 : selBySG2.state = true
						4 : selBySG3.state = true
						8 : selBySG4.state = true
						16 : selBySG5.state = true
						32 : selBySG6.state = true
						64 : selBySG7.state = true
						128 : selBySG8.state = true
						256 : selBySG9.state = true
						512 : selBySG10.state = true
						1024 : selBySG11.state = true
						2048 : selBySG12.state = true
						4096 : selBySG13.state = true
						8192 : selBySG14.state = true
						16384 : selBySG15.state = true
						32768 : selBySG16.state = true
					)
					
				)
					
			)
	)
	-- 	(
	-- 		SG_callBack = undefined
	-- 		gc light:true	
	-- 	)

	fn rol_EditPoly =
	(
		rollout Edit_Rol "Testing Buttons" width:162 height:86
		(
			button 'Editable_Poly_Button' "Editable Poly first!" pos:[22,15] width:115 height:55 align:#left 
			on Editable_Poly_Button pressed do
			(
				convertTo $ Editable_Poly
				DestroyDialog Edit_Rol
			)
		)
		createDialog Edit_Rol 
	)

	fn selSmG SelVal =
	(
		if selection.count == 0 then messagebox "Select some object first!" title:"Warning" beep:off else
		(
			if classOf $ != Editable_Poly then rol_EditPoly() else
			(
			max modify mode
			subobjectLevel = 4
			$.EditablePoly.selectBySmoothGroup SelVal
			selBynum = case SelVal of 
			(
				1 : selBySG1
				2 : selBySG2
				4 : selBySG3
				8 : selBySG4
				16 : selBySG5
				32 : selBySG6
				64 : selBySG7
				128 : selBySG8
				256 : selBySG9
				512 : selBySG10
				1024 : selBySG11
				2048 : selBySG12
				4096 : selBySG13
				8192 : selBySG14
				16384 : selBySG15
				32768 : selBySG16
			)
			-- selBynum.highlightColor = selBycol
			selBynum.state = true
			CompleteRedraw()
			)
		)

	)

	fn setSmG SetVal =
	(
		if selection.count == 0 then messagebox "Select some object first!" title:"Warning" beep:off else
		(
			if classOf $ != Editable_Poly then rol_EditPoly() else
			(
			max modify mode
			subobjectLevel = 4
			$.EditablePoly.setSmoothingGroups SetVal -1 1

			$.showVertexColors = true
			$.vertexColorsShaded = true
			
			setBycol = case SetVal of 
			(
			1 : color 230 50 50
			2 : color 200 200 0
			4 : color 120 200 60
			8 : color 90 150 230
			16 : color 240 150 190
			32 : color 145 0 224
			64 : color 224 0 224
			128 : color 224 224 224
			256 : color 124 0 0
			512 : color 124 045 0
			1024 : color 124 124 0
			2048 : color 145 124 0
			4096 : color 0 145 124
			8192 : color 145 0 124
			16384 : color 124 0 124
			32768 : color 124 124 124
			)

			$.EditablePoly.SetFaceColor (setBycol) #VertexColor
			
			setBynum = case SetVal of 
			(
			1 : selBySG1
			2 : selBySG2
			4 : selBySG3
			8 : selBySG4
			16 : selBySG5
			32 : selBySG6
			64 : selBySG7
			128 : selBySG8
			256 : selBySG9
			512 : selBySG10
			1024 : selBySG11
			2048 : selBySG12
			4096 : selBySG13
			8192 : selBySG14
			16384 : selBySG15
			32768 : selBySG16
			)
			setBynum.state = true
			-- setBynum.highlightColor = setBycol

			CompleteRedraw()
			)
		)
	)

	fn setBySG_FN =
	(
		if selection.count == 0 then messagebox "Select some object first!" title:"Warning" beep:off else
		(
			if classOf $ != Editable_Poly then rol_EditPoly() else
			(
				off_state()
				$.showVertexColors = true
				$.vertexColorsShaded = true

				max modify mode
				subobjectLevel = 4

				$.EditablePoly.selectBySmoothGroup 1
				$.EditablePoly.SetFaceColor (color 230 50 50) #VertexColor
				s1 = getFaceSelection selection[1] as Array
				
				$.EditablePoly.selectBySmoothGroup 2
				$.EditablePoly.SetFaceColor (color 200 200 0) #VertexColor
				s2 = getFaceSelection selection[1] as Array
				
				$.EditablePoly.selectBySmoothGroup 4
				$.EditablePoly.SetFaceColor (color 120 200 60) #VertexColor
				s3 = getFaceSelection selection[1] as Array
				
				$.EditablePoly.selectBySmoothGroup 8
				$.EditablePoly.SetFaceColor (color 90 150 230) #VertexColor
				s4 = getFaceSelection selection[1] as Array
				
				$.EditablePoly.selectBySmoothGroup 16
				$.EditablePoly.SetFaceColor (color 240 150 190) #VertexColor
				s5 = getFaceSelection selection[1] as Array
				
				$.EditablePoly.selectBySmoothGroup 32
				$.EditablePoly.SetFaceColor (color 145 0 224) #VertexColor
				s6 = getFaceSelection selection[1] as Array
				
				$.EditablePoly.selectBySmoothGroup 64
				$.EditablePoly.SetFaceColor (color 224 0 224) #VertexColor
				s7 = getFaceSelection selection[1] as Array
				
				$.EditablePoly.selectBySmoothGroup 128
				$.EditablePoly.SetFaceColor (color 224 224 224) #VertexColor
				s8 = getFaceSelection selection[1] as Array
				
				$.EditablePoly.selectBySmoothGroup 256
				$.EditablePoly.SetFaceColor (color 124 0 0) #VertexColor
				s9 = getFaceSelection selection[1] as Array
				
				$.EditablePoly.selectBySmoothGroup 512
				$.EditablePoly.SetFaceColor (color 124 045 0) #VertexColor
				s10 = getFaceSelection selection[1] as Array
				
				$.EditablePoly.selectBySmoothGroup 1024
				$.EditablePoly.SetFaceColor (color 124 124 0) #VertexColor
				s11 = getFaceSelection selection[1] as Array
				
				$.EditablePoly.selectBySmoothGroup 2048
				$.EditablePoly.SetFaceColor (color 124 124 0) #VertexColor
				s12 = getFaceSelection selection[1] as Array
				
				$.EditablePoly.selectBySmoothGroup 4096
				$.EditablePoly.SetFaceColor (color 0 145 124) #VertexColor
				s13 = getFaceSelection selection[1] as Array
				
				$.EditablePoly.selectBySmoothGroup 8192
				$.EditablePoly.SetFaceColor (color 145 0 124) #VertexColor
				s14 = getFaceSelection selection[1] as Array
				
				$.EditablePoly.selectBySmoothGroup 16384
				$.EditablePoly.SetFaceColor (color 124 0 124) #VertexColor
				s15 = getFaceSelection selection[1] as Array
				
				$.EditablePoly.selectBySmoothGroup 32768
				$.EditablePoly.SetFaceColor (color 124 124 124) #VertexColor
				s16 = getFaceSelection selection[1] as Array
				
				max select none
				
				if s1.count != 0 then selBySG1.state = true
				if s2.count != 0 then selBySG2.state = true
				if s3.count != 0 then selBySG3.state = true
				if s4.count != 0 then selBySG4.state = true
				if s5.count != 0 then selBySG5.state = true
				if s6.count != 0 then selBySG6.state = true
				if s7.count != 0 then selBySG7.state = true
				if s8.count != 0 then selBySG8.state = true
				if s9.count != 0 then selBySG9.state = true
				if s10.count != 0 then selBySG10.state = true
				if s11.count != 0 then selBySG11.state = true
				if s12.count != 0 then selBySG12.state = true
				if s13.count != 0 then selBySG13.state = true
				if s14.count != 0 then selBySG14.state = true
				if s15.count != 0 then selBySG15.state = true
				if s16.count != 0 then selBySG16.state = true
			)
		)
	)

	on Vcol_by_SG open do (nodeVertsChange = nodeEventCallback subobjectSelectionChanged:SG_callBack)

	on SG_spn buttonup do
	(   
		if selection.count == 0 then messagebox "Select some object first!" title:"Warning" beep:off else
		(
			if classOf $ != Editable_Poly then rol_EditPoly() else
			(  
				max modify mode
				subobjectlevel = 4
				max select all
				sel = selection as array 
				for obj in sel do 
					(
					obj.autoSmoothThreshold = (SG_spn.value)
					polyop.autoSmooth $
					)
				max select none
				setBySG_FN()
			)
			
		)
	)
	
	on setBySG_bt pressed do (setBySG_FN() )

	on Vcol pressed do
	(
		sel = selection as array
		for obj in sel do
		(
			i = obj.showVertexColors
			if  i == false then
			(
				obj.showVertexColors = true
				obj.vertexColorsShaded = true
			)
			else 
			(
				obj.showVertexColors = false
				obj.vertexColorsShaded = false
			)
				
		)
		select sel
		CompleteRedraw()
	)

	on clear_Vcol pressed do
	(
		if selection.count == 0 then messagebox "Select some object first!" title:"Warning" beep:off else
		(
			if classOf $ != Editable_Poly then rol_EditPoly() else
			(
				channelInfo.ClearChannel $ 0
				convertToPoly $
				max modify mode
				$.showVertexColors = false
				
				subobjectlevel = 4
				max select all
				
				$.EditablePoly.setSmoothingGroups 0 -1 1
				$.EditablePoly.setSmoothingGroups 1 -1 1
				max select none
	
			)
		)
	)

	on selBySG1 changed state do (selSmG(1) )
	on selBySG2 changed state do (selSmG(2) )
	on selBySG3 changed state do (selSmG(4) )
	on selBySG4 changed state do (selSmG(8) )
	on selBySG5 changed state do (selSmG(16) )
	on selBySG6 changed state do (selSmG(32) )
	on selBySG7 changed state do (selSmG(64) )
	on selBySG8 changed state do (selSmG(128) )
	on selBySG9 changed state do (selSmG(256) )
	on selBySG10 changed state do (selSmG(512) )
	on selBySG11 changed state do (selSmG(1024) )
	on selBySG12 changed state do (selSmG(2048) )
	on selBySG13 changed state do (selSmG(4096) )
	on selBySG14 changed state do (selSmG(8192) )
	on selBySG15 changed state do (selSmG(16384) )
	on selBySG16 changed state do (selSmG(32768) )

	on selBySG1 rightClick do (setSmG(1) )
	on selBySG2 rightClick do (setSmG(2) )	
	on selBySG3 rightClick do (setSmG(4) )	
	on selBySG4 rightClick do (setSmG(8) )	
	on selBySG5 rightClick do (setSmG(16) )	
	on selBySG6 rightClick do (setSmG(32) )	
	on selBySG7 rightClick do (setSmG(64) )	
	on selBySG8 rightClick do (setSmG(128) )	
	on selBySG9 rightClick do (setSmG(256) )	
	on selBySG10 rightClick do (setSmG(512) )	
	on selBySG11 rightClick do (setSmG(1024) )	
	on selBySG12 rightClick do (setSmG(2048) )	
	on selBySG13 rightClick do (setSmG(4096) )	
	on selBySG14 rightClick do (setSmG(8192) )	
	on selBySG15 rightClick do (setSmG(16384) )
	on selBySG16 rightClick do (setSmG(32768) )
)
createDialog Vcol_by_SG