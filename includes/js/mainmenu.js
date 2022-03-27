mm0.SetPosition('relative',0,0);

if(_browser._name == "Konqueror")
{
	mm0.SetCorrection(11,10);
	mm0._pop.SetCorrection(3,-20);
}
else
{
	mm0.SetCorrection(1,-1);
	mm0._pop.SetCorrection(3,0);
}
//mm0.SetCellSpacing(5);
//mm0.SetItemDimension(0,0);
mm0.SetCellSpacing(1);
mm0.SetItemDimension(85,26);
mm0.SetBackground('#fcfdfe','','','');
mm0.SetItemText('black','','bold','','');
mm0.SetItemBackground('','','','');
mm0.SetItemBorder(0,'buttonface','');
mm0.SetItemTextHL('','','bold','','');
mm0.SetItemBackgroundHL('','','','');
mm0.SetItemBorderHL(0,'','');
mm0.SetItemTextClick('','','bold','','');
mm0.SetItemBackgroundClick('','','','');
mm0.SetItemBorderClick(0,'black','solid');
mm0.SetBorder(0,'#dfdfdf','');

mm0._pop.SetFont('verdana,tahoma,arial','10pt');
mm0._pop.SetItemDimension(100,18);
mm0._pop.SetCorrection(0,0);
mm0._pop.SetAlpha(90);
mm0._pop.SetPaddings(1);
mm0._pop.SetBackground('whitesmoke','images/xp.gif','repeat-y','top left');
mm0._pop.SetSeparator(200,'right','gray','');
mm0._pop.SetExpandIcon(true,'',6);
mm0._pop.SetFont('tahoma','8pt');
mm0._pop.SetBorder(1,'gray','solid');
mm0._pop.SetDelay(500);