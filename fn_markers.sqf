if(isNil'MARKER_ID')then
{
    arr = [];
    {
        switch (getMarkerType _x) do 
        {
            case "ExileTraderZone":
            {
                private _centerPosition = getMarkerPos _x;
                private _radius = (getMarkerSize _x) select 0;
                private _circumference = 2 * pi * _radius;
                private _steps = _circumference / 40;
                private _anglePerStep = 360 / _steps;
                for "_i" from 0 to _steps do
                {
                    private _angle = _i * _anglePerStep;
                    private _position =
                    [
                        (_centerPosition select 0) + (cos _angle) * _radius,
                        (_centerPosition select 1) + (sin _angle) * _radius,
                        0
                    ];
                    if !(surfaceIsWater _position) then
                    {
                        private _object = createSimpleObject ["exile_assets\model\exile_zonemarker_Red.p3d",ATLToASL _position,true];
                        _object setDir (-_angle + 90);
                        arr pushBack _object;
                    };
                };
            };
        };
    } forEach allMapMarkers;
    ['SuccessTitleOnly', ['Trader zone 3d markers enabled']] call ExileClient_gui_toaster_addTemplateToast;      
    MARKER_ID = true;
    (_this select 0) ctrlSetStructuredText parseText '<t color="#FF0000">3d trader markers</t>';
}
else
{
    {
        deleteVehicle _x;
    } forEach arr;
    ['SuccessTitleOnly', ['Trader zone 3d markers disabled']] call ExileClient_gui_toaster_addTemplateToast;      
    MARKER_ID = nil;
    (_this select 0) ctrlSetStructuredText parseText '<t color="#44CD00">3d trader markers</t>';  
};