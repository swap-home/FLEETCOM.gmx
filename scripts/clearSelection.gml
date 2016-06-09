with(global.selection_manager)
{
    var i;
    for (i = 0; i < ds_list_size(selection); i+=1)
    {
        var unitId = ds_list_find_value(selection, i);
        if (instance_exists(unitId)) {
            unitId.selected = false;
        }
    }
    ds_list_clear(selection);
}
