unit HeatmapItem;

interface
type
  THeatmapItem=record
       Longitude:Double;
       Latitude:Double;
       Count:Double;
  end;

  Theatmaplist=record
      count:Integer;
      arr:array[0..1000] of THeatmapItem;
  end;

  THeatMapItemArray = array of THeatmapItem;

implementation

end.
