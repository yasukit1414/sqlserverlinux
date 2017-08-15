
CREATE SPATIAL INDEX sixd ON expresslog(geo)
USING GEOGRAPHY_GRID
WITH (GRIDS = (LOW, LOW, MEDIUM, HIGH),
      CELLS_PER_OBJECT = 20)


drop index sixd on expresslog