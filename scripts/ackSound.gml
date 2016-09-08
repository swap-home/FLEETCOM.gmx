if (!global.sfx) {
    exit;
}

var MAX_SOUND = 16;
var toplay = irandom_range(1,MAX_SOUND);

switch(toplay)
{
    case 1: sound_play(ack1);break;
    case 2: sound_play(ack2);break;
    case 3: sound_play(ack3);break;
    case 4: sound_play(ack4);break;
    case 5: sound_play(ack5);break;
    case 6: sound_play(ack6);break;
    case 7: sound_play(ack7);break;
    case 8: sound_play(ack8);break;
    case 9: sound_play(ack9);break;
    case 10: sound_play(ack10);break;
    case 11: sound_play(ack11);break;
    case 12: sound_play(ack12);break;
    case 13: sound_play(ack13);break;
    case 14: sound_play(ack14);break;
    case 15: sound_play(ack15);break;
    case 16: sound_play(ack16);break;
}
