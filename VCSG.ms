try(destroyDialog VC_by_SG)catch()
rollout VC_by_SG "VCSG" width:170 height:210
(


	spinner 'SG_spn' "SG" pos:[95,42] width:60 height:16 range:[0,180,20] type:#integer scale:1 align:#left
	button 'smt_gr1' "SG 1" pos:[8,42] width:85 height:16 align:#left
	button 'setBySG_bt' "set SG" pos:[8,5] width:85 height:35 toolTip:"" align:#left
	checkbutton 'Vcol_on_off' "Vcol on/off" pos:[95,24] width:65 height:16 toolTip:"" align:#left
	button 'clear_Vcol' "Vcol clear" pos:[95,6] width:65 height:16 align:#left
	checkbutton 'selBySG1' "1" pos:[6,63] width:19 height:12 highlightColor:(color 230 50 50) align:#left
	checkbutton 'selBySG2' "2" pos:[26,63] width:19 height:12 highlightColor:(color 200 200 0) align:#left
	checkbutton 'selBySG3' "3" pos:[46,63] width:19 height:12 highlightColor:(color 120 200 60) align:#left
	checkbutton 'selBySG4' "4" pos:[66,63] width:19 height:12 highlightColor:(color 90 150 230) align:#left
	checkbutton 'selBySG5' "5" pos:[86,63] width:19 height:12 highlightColor:(color 240 150 190) align:#left
	checkbutton 'selBySG6' "6" pos:[106,63] width:19 height:12 highlightColor:(color 145 0 224) align:#left
	checkbutton 'selBySG7' "7" pos:[125,63] width:19 height:12 highlightColor:(color 224 0 224) align:#left
	checkbutton 'selBySG8' "8" pos:[144,63] width:19 height:12 highlightColor:(color 224 224 224) align:#left
	checkbutton 'selBySG9' "9" pos:[6,76] width:19 height:12 highlightColor:(color 124 0 0) align:#left
	checkbutton 'selBySG10' "10" pos:[26,76] width:19 height:12 highlightColor:(color 124 45 0) align:#left
	checkbutton 'selBySG11' "11" pos:[46,76] width:19 height:12 highlightColor:(color 124 124 0) align:#left
	checkbutton 'selBySG12' "12" pos:[66,76] width:19 height:12 highlightColor:(color 145 124 0) align:#left
	checkbutton 'selBySG13' "13" pos:[86,75] width:19 height:12 highlightColor:(color 0 145 124) align:#left
	checkbutton 'selBySG14' "14" pos:[106,76] width:19 height:12 highlightColor:(color 145 0 124) align:#left
	checkbutton 'selBySG15' "15" pos:[125,76] width:19 height:12 highlightColor:(color 124 0 124) align:#left
	checkbutton 'selBySG16' "16" pos:[144,76] width:19 height:12 highlightColor:(color 124 124 124) align:#left
	
	dotNetControl 'VCSG_logo' "System.Windows.Forms.PictureBox" pos:[6,95] width:155 height:85 align:#left
	HyperLink 'email' "praswna@gmail.com" pos:[65,180] width:155 height:16 address:"praswna@gmail.com" color:(color 155 155 155) align:#left
	HyperLink 'at_page' "artstation.com/praswna" pos:[55,193] width:155 height:16 address:"https://www.artstation.com/praswna" color:(color 155 155 155) align:#left

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
			Vcol_on_off.state = on
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
				Vcol_on_off.state = on
			)
		)
	)



	
	local bmLogoBase64String = "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"
	fn base64str_to_dotnet_image str = -- https://codebeautify.org/image-to-base64-converter
	(
		ConvertClass = dotNetClass "System.Convert"
		ImageClass = dotNetClass "System.Drawing.Image"
		
		byteArr = ConvertClass.FromBase64String str
		memstream = dotnetobject "System.IO.MemoryStream" byteArr
		DecodedImg = ImageClass.fromstream memstream
		memstream.close() ; 
		
		DecodedImg --return
	)--end fn



	on VC_by_SG open do
	(
		nodeVertsChange = nodeEventCallback subobjectSelectionChanged:SG_callBack
		VCSG_logo.AllowDrop = on
		VCSG_logo.image = base64str_to_dotnet_image bmLogoBase64String
	
	)
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
	on setBySG_bt pressed do
		(setBySG_FN() )
	
	on Vcol_on_off changed state do
	(
		sel = selection as array
		for obj in sel do
		(
		   if state == on then
				obj.showVertexColors = true
				obj.vertexColorsShaded = true	
		   if state == off then
				obj.showVertexColors = false
				obj.vertexColorsShaded = true
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
-- 				max select all
-- 				
-- 				$.EditablePoly.setSmoothingGroups 0 -1 1
-- 				$.EditablePoly.setSmoothingGroups 1 -1 1
				max select none
				Vcol_on_off.state = off
			)
		)
	)
	on smt_gr1 pressed do
	( 
		if selection.count == 0 then messagebox "Select some object first!" title:"Warning" beep:off else
		(
		if classOf $ != Editable_Poly then rol_EditPoly() else
			(
			max modify mode
			subobjectlevel = 4
			max select all
			
			$.EditablePoly.setSmoothingGroups 0 -1 1
			$.EditablePoly.setSmoothingGroups 1 -1 1
			max select none
			--max create mode
			setBySG_FN()
			)
		)
		Vcol_on_off.state = on
	)
	on selBySG1 changed state do
		(selSmG(1) )
	on selBySG1 rightClick do
		(off_state() setSmG(1) )
	on selBySG2 changed state do
		(selSmG(2) )
	on selBySG2 rightClick do
		(off_state() setSmG(2) )
	on selBySG3 changed state do
		(selSmG(4) )
	on selBySG3 rightClick do
		(off_state() setSmG(4) )
	on selBySG4 changed state do
		(selSmG(8) )
	on selBySG4 rightClick do
		(off_state() setSmG(8) )
	on selBySG5 changed state do
		(selSmG(16) )
	on selBySG5 rightClick do
		(off_state() setSmG(16) )
	on selBySG6 changed state do
		(selSmG(32) )
	on selBySG6 rightClick do
		(off_state() setSmG(32) )
	on selBySG7 changed state do
		(selSmG(64) )
	on selBySG7 rightClick do
		(off_state() setSmG(64) )
	on selBySG8 changed state do
		(selSmG(128) )
	on selBySG8 rightClick do
		(off_state() setSmG(128) )
	on selBySG9 changed state do
		(selSmG(256) )
	on selBySG9 rightClick do
		(off_state() setSmG(256) )
	on selBySG10 changed state do
		(selSmG(512) )
	on selBySG10 rightClick do
		(off_state() setSmG(512) )
	on selBySG11 changed state do
		(selSmG(1024) )
	on selBySG11 rightClick do
		(off_state() setSmG(1024) )
	on selBySG12 changed state do
		(selSmG(2048) )
	on selBySG12 rightClick do
		(off_state() setSmG(2048) )
	on selBySG13 changed state do
		(selSmG(4096) )
	on selBySG13 rightClick do
		(off_state() setSmG(4096) )
	on selBySG14 changed state do
		(selSmG(8192) )
	on selBySG14 rightClick do
		(off_state() setSmG(8192) )
	on selBySG15 changed state do
		(selSmG(16384) )
	on selBySG15 rightClick do
		(off_state() setSmG(16384) )
	on selBySG16 changed state do
		(selSmG(32768) )
	on selBySG16 rightClick do
		(off_state() setSmG(32768) )
)
createDialog VC_by_SG