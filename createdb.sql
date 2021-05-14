CREATE TABLE Hybrid_Information(
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

CREATE TABLE PaketID(
Hybrid_ID text,
Paket_ID text,
Comments text,
PRIMARY KEY(Hybrid_ID)
);

CREATE VIEW Hybrid_Overview as SELECT Hybrid_Overview.Hybrid_ID,Hybrid_Overview.Measurement_ID, Paket_ID, Hybrid_Overview.Hybrid_Class, Hybrid_Overview.VMM, Hybrid_Overview.VMM_Class, Hybrid_Overview.BrokenChannels, Hybrid_Overview.Location, Hybrid_Overview.Date, Comments, Hybrid_Overview.MonitorADCSlope, Hybrid_Overview.MonitorADCIntercept, Hybrid_Overview.Baseline, Hybrid_Overview.BaseNoise, Hybrid_Overview.Threshold, Hybrid_Overview.WorkingChannelsExt, Hybrid_Overview.WorkingChannelsInt, Hybrid_Overview.AvgCurr1_9V, Hybrid_Overview.AvgCurr2_9V, Hybrid_Overview.ADCExtCurvature, Hybrid_Overview.ADCIntCurvature, Hybrid_Overview.ADCExtVertex, Hybrid_Overview.ADCIntVertex, Hybrid_Overview.AVGTDC FROM Hybrid_Overview LEFT JOIN PaketID ON Hybrid_Overview.Hybrid_ID= PaketID.Hybrid_ID;

CREATE VIEW latest_measurements as SELECT * from hybrid_overview WHERE measurement_id IN (SELECT max FROM(SELECT hybrid_id,MAX(measurement_id) as max FROM hybrid_overview GROUP BY hybrid_id) as foo);
