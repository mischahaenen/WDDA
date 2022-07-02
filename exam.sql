-- Select name, kanton und einwohner von Gemeinden in den Kantonen Bern und Zürich zurückgibt, welche mehr als 40'000 Einwohner haben.
SELECT name, kanton, einwohner FROM Gemeinde WHERE kanton in ('BE', 'ZH') AND einwohner > 40000
ORDER BY einwohner DESC;

