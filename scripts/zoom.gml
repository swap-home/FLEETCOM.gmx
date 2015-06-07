//one example of zooming by GS-games:
var smallest,largest,zoom_speed;
smallest = 1024 //smallest view size width here
largest = 3072 //largest view size width here
zoom_speed = 10 //the zoom speed


if (mouse_wheel_down()=true)
{
if (view_wview[view_current]<largest) 
{

view_wview[view_current]+=(view_wview[view_current]/100*zoom_speed)
view_hview[view_current]+=(view_hview[view_current]/100*zoom_speed)

}
}


if (mouse_wheel_up()=true)
{
if (view_wview[view_current]>smallest) 
{

view_wview[view_current]-=(view_wview[view_current]/100*zoom_speed)
view_hview[view_current]-=(view_hview[view_current]/100*zoom_speed)

}
}
