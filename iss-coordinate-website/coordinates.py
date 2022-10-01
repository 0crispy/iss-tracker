import requests
import time
import ephem


from flask import Flask
from flask_frozen import Freezer

app = Flask(__name__)
freezer = Freezer(app)


@app.route('/')
def hello():
    res = requests.get('https://celestrak.org/NORAD/elements/gp.php?CATNR=25544&FORMAT=TLE')
    str_content = res.content
    Name = "ISS (ZARYA)"
    line1 = str_content[26:95].decode()
    line2 = str_content[97:166].decode()

    # while True:
    tlerec = ephem.readtle(Name, line1, line2)
    tlerec.compute()

    sublat = float(repr(tlerec.sublong))*57.2957795
    sublong = float(repr(tlerec.sublat))*57.2957795

    return str(tlerec.elevation) + "\n" + str(sublat) + "\n"+ str(sublong)
        # time.sleep(1)
freezer.freeze()

#app.run(debug=False)


