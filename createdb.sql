CREATE TABLE Hybrid_Overview(
Hybrid_ID text,
Measurement_ID text,
Hybrid_Class text,
VMM int,
VMM_Class text,
BrokenChannels int[],
Location text,
Date date,
MonitorADCSlope real,
MonitorADCIntercept real,
Baseline real,
BaseNoise real,
Threshold real,
WorkingChannelsExt int,
WorkingChannelsInt int,
AvgCurr1_9V real,
AvgCurr2_9V real,
ADCExtCurvature real,
ADCIntCurvature real,
ADCExtVertex real,
ADCIntVertex real,
AVGTDC real,
PRIMARY KEY(Measurement_ID, VMM)
);

CREATE TABLE Hybrid_Data(
Measurement_ID text,
Hybrid_ID text,
Date date,
Measurement_type text,
labels text [],
PRIMARY KEY(Measurement_ID,Measurement_type)
);


CREATE TABLE configs(
Measurement_ID text,
Date date,
Filename text,
Filecontent text,
PRIMARY KEY(Measurement_ID,Filename)
);

CREATE TABLE logs(
Measurement_ID text,
llog text,
PRIMARY KEY(Measurement_ID)
);

CREATE VIEW latest_measurements as SELECT * from hybrid_overview WHERE measurement_id IN (SELECT max FROM(SELECT hybrid_id,MAX(measurement_id) as max FROM hybrid_overview GROUP BY hybrid_id) as foo);
