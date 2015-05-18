var selfid;
selfid = argument0;
with(global.selection_manager)
{
    var ind;
    ind = ds_list_find_index(selection,selfid);
    ds_list_delete(selection,ind);
    selfid.selected = false;
}
