var ctrlgrp, deleteme;

ctrlgrp = argument0;
deleteme = ds_stack_create();

for (var i = 0; i < ds_list_size(ctrlgrp); i++)
{
    if (!instance_exists(ctrlgrp[| i]))
    {
        ds_stack_push(deleteme, ctrlgrp[| i]);
    }
}

while(!ds_stack_empty(deleteme))
{
    var deleteid = ds_stack_pop(deleteme);
    ds_list_delete(ctrlgrp, (ds_list_find_index(ctrlgrp, deleteid)));
}

ds_stack_destroy(deleteme);
