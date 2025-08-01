function Calendar(e, t, n, i, a) {
    this.id = e, this.size = t, this.labelSettings = n, this.colors = i, this.initday = 0, a = a || {}, this.indicator = !0, null != a.indicator && (this.indicator = a.indicator), this.indicator_type = 1, null != a.indicator_type && (this.indicator_type = a.indicator_type), this.indicator_pos = 1 == this.indicator_type ? "bottom" : "top", null != a.indicator_pos && (this.indicator_pos = a.indicator_pos);
    i = document.createElement("LI");
    i.className = "cjslib-list-placeholder", i.appendChild(document.createTextNode("No events on this day")), i.style = "text-align: center; padding: 20px 0px;", this.placeholder = i.outerHTML, null != a.placeholder && (this.placeholder = a.placeholder);
    i = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    null != a.months && 12 == a.months.length && (i = a.months);
    var d = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    null != a.days && 7 == a.days.length && (d = a.days), this.months = i, this.defaultLabels = d, this.label = [], this.labels = [];
    for (var o = 0; o < 7; o++) this.label.push(d[d.indexOf(n[0]) + this.label.length >= d.length ? Math.abs(d.length - (d.indexOf(n[0]) + this.label.length)) : d.indexOf(n[0]) + this.label.length]);
    for (o = 0; o < 7; o++) this.labels.push(this.label[o].substring(0, 3 < n[1] ? 3 : n[1]));
    this.date = new Date, this.today = new Date, this.history = [], this.draw(), this.update(), this.setOnClickListener("days-blocks"), this.setOnClickListener("month-slider"), this.setOnClickListener("year-slider")
}

function Organizer(e, t, n) {
    this.id = e, this.calendar = t, this.data = n || {}, this.draw();
    var i = this;
    i.onMonthChange(function() {
        i.indicateEvents()
    }), this.setOnClickListener("days-blocks"), this.setOnClickListener("day-slider"), this.setOnClickListener("month-slider"), this.setOnClickListener("year-slider"), this.setOnLongClickListener("days-blocks")
}
Calendar.prototype = {
    constructor: Calendar,
    back: function(e) {
        var t = this.date,
            n = (new Date(11 < t.getMonth() + 1 ? t.getFullYear() + 1 : t.getFullYear(), 12 < t.getMonth() + 1 ? 0 : t.getMonth() + 1, 0).getDate(), new Date(t.getMonth() < 0 ? t.getFullYear() - 1 : t.getFullYear(), t.getMonth() < 0 ? 11 : t.getMonth(), 0).getDate());
        "month" == e ? (t.getDate() > n && this.changeDateTo(n), 0 < t.getMonth() ? t.setMonth(t.getMonth() - 1) : (t.setMonth(11), t.setFullYear(t.getFullYear() - 1))) : "year" == e && t.setFullYear(t.getFullYear() - 1), this.update()
    },
    next: function(e) {
        var t = this.date,
            n = (new Date(11 < t.getMonth() + 1 ? t.getFullYear() + 1 : t.getFullYear(), 12 < t.getMonth() + 1 ? 0 : t.getMonth() + 1, 0).getDate(), new Date(11 < t.getMonth() + 2 ? t.getFullYear() + 1 : t.getFullYear(), 12 < t.getMonth() + 2 ? 0 : t.getMonth() + 2, 0).getDate());
        "month" == e ? (t.getDate() > n && this.changeDateTo(n), 11 != t.getMonth() ? t.setMonth(t.getMonth() + 1) : (t.setMonth(0), t.setFullYear(t.getFullYear() + 1))) : t.setFullYear(t.getFullYear() + 1), this.update()
    },
    changeDateTo: function(e, t) {
        if (31 <= t && e <= 11 || t <= 6 && 8 <= e) {
            31 <= t && e <= 11 ? this.next("month") : t <= 6 && 8 <= e && this.back("month"), this.date.setDate(e);
            var n = this;
            return setTimeout(function() {
                n.update()
            }, 1), !0
        }
        this.date.setDate(e)
    },
    getDateString: function() {
        return this.months[this.date.getMonth()] + " " + this.date.getDate() + ", " + this.date.getFullYear()
    }
}, Calendar.prototype.draw = function() {
    var e = '<svg style="width: 24px; height: 24px;" viewBox="0 0 24 24"><path fill="' + this.colors[3] + '" d="M15.41,16.58L10.83,12L15.41,7.41L14,6L8,12L14,18L15.41,16.58Z"></path></svg>',
        t = '<svg style="width: 24px; height: 24px;" viewBox="0 0 24 24"><path fill="' + this.colors[3] + '" d="M8.59,16.58L13.17,12L8.59,7.41L10,6L16,12L10,18L8.59,16.58Z"></path></svg>',
        n = document.createElement("DIV");
    n.className = "cjslib-calendar cjslib-size-" + this.size, document.getElementById(this.id).appendChild(n.cloneNode(!0));
    for (var i, a, d = [], o = ["year", "month", "labels", "days"], l = 0; l < o.length; l++) d[l] = document.createElement("DIV"), d[l].className = "cjslib-" + o[l], "days" != o[l] && ("month" != o[l] ? (d[l].style.backgroundColor = this.colors[1], d[l].style.color = this.colors[3], "labels" != o[l] && ((i = document.createElement("DIV")).id = this.id + "-year-back", i.insertAdjacentHTML("beforeend", e), d[l].appendChild(i.cloneNode(!0)), (m = document.createElement("SPAN")).id = this.id + "-" + o[l], d[l].appendChild(m.cloneNode(!0)), (a = document.createElement("DIV")).id = this.id + "-year-next", a.insertAdjacentHTML("beforeend", t), d[l].appendChild(a.cloneNode(!0)))) : (d[l].style.backgroundColor = this.colors[0], d[l].style.color = this.colors[2], (i = document.createElement("DIV")).id = this.id + "-month-back", i.insertAdjacentHTML("beforeend", e), d[l].appendChild(i.cloneNode(!0)), (m = document.createElement("SPAN")).id = this.id + "-" + o[l], d[l].appendChild(m.cloneNode(!0)), (a = document.createElement("DIV")).id = this.id + "-month-next", a.insertAdjacentHTML("beforeend", t), d[l].appendChild(a.cloneNode(!0))));
    for (l = 0; l < this.labels.length; l++) {
        var s = document.createElement("SPAN");
        s.id = this.id + "-label-" + (l + 1), s.appendChild(document.createTextNode(this.labels[l]).cloneNode(!0)), d[2].appendChild(s.cloneNode(!0))
    }
    for (var c = [], r = [], h = [], l = 0; l < 6; l++) c[l] = document.createElement("DIV"), c[l].className = "cjslib-row";
    for (var m, u, l = 0, g = 0; l < 42; l++) h[l] = document.createElement("INPUT"), h[l].className = "cjslib-day-radios", h[l].type = "radio", h[l].name = this.id + "-day-radios", h[l].id = this.id + "-day-radio-" + (l + 1), r[l] = document.createElement("LABEL"), r[l].className = "cjslib-day", r[l].htmlFor = this.id + "-day-radio-" + (l + 1), r[l].id = this.id + "-day-" + (l + 1), (m = document.createElement("SPAN")).className = "cjslib-day-num", m.id = this.id + "-day-num-" + (l + 1), r[l].appendChild(m.cloneNode(!0)), this.indicator && ((u = document.createElement("SPAN")).className = "cjslib-day-indicator cjslib-indicator-pos-" + this.indicator_pos, 1 == this.indicator_type && (u.className += " cjslib-indicator-type-numeric"), u.id = this.id + "-day-indicator-" + (l + 1), r[l].appendChild(u.cloneNode(!0))), c[g].appendChild(h[l].cloneNode(!0)), c[g].appendChild(r[l].cloneNode(!0)), (l + 1) % 7 == 0 && g++;
    for (l = 0; l < 6; l++) d[3].appendChild(c[l].cloneNode(!0));
    for (l = 0; l < d.length; l++) n.appendChild(d[l].cloneNode(!0));
    document.getElementById(this.id).innerHTML = "<style>.cjslib-day-indicator { color: " + this.colors[1] + "; background-color: " + this.colors[1] + "; } .cjslib-indicator-type-numeric { color: " + this.colors[2] + "; } .cjslib-day.cjslib-day-today > .cjslib-day-num { border-color: " + this.colors[1] + " !important; }</style>", document.getElementById(this.id).appendChild(n.cloneNode(!0))
}, Calendar.prototype.update = function() {
    document.getElementById(this.id + "-year").innerHTML = this.date.getFullYear(), document.getElementById(this.id + "-month").innerHTML = this.months[this.date.getMonth()];
    for (var e = 1; e <= 42; e++) document.getElementById(this.id + "-day-num-" + e).innerHTML = "", document.getElementById(this.id + "-day-" + e).className = this.id + " cjslib-day cjslib-day-listed";
    var t = new Date(this.date.getFullYear(), this.date.getMonth(), 1).getDay(),
        n = new Date(11 < this.date.getMonth() + 1 ? this.date.getFullYear() + 1 : this.date.getFullYear(), 12 < this.date.getMonth() + 1 ? 0 : this.date.getMonth() + 1, 0).getDate(),
        i = new Date(this.date.getMonth() < 0 ? this.date.getFullYear() - 1 : this.date.getFullYear(), this.date.getMonth() < 0 ? 11 : this.date.getMonth(), 0).getDate();
    this.initday = this.label.indexOf(this.defaultLabels[t]);
    for (var t = this.defaultLabels[t], a = this.label.indexOf(t), e = 0, d = i; e < a; e++, d--) document.getElementById(this.id + "-day-num-" + (a - e)).innerHTML = d, document.getElementById(this.id + "-day-" + (a - e)).className = this.id + " cjslib-day cjslib-day-diluted";
    for (e = 1; e <= n; e++)(document.getElementById(this.id + "-day-num-" + (a + e)).innerHTML = e) == this.date.getDate() && (document.getElementById(this.id + "-day-radio-" + (a + e)).checked = !0), this.date.getMonth() == this.today.getMonth() && e == this.today.getDate() && (document.getElementById(this.id + "-day-" + (a + e)).className += " cjslib-day-today");
    for (e = n + 1, d = 1; a + e <= 42; e++, d++) document.getElementById(this.id + "-day-num-" + (a + e)).innerHTML = d, document.getElementById(this.id + "-day-" + (a + e)).className = this.id + " cjslib-day cjslib-day-diluted"
}, Calendar.prototype.setupBlock = function(e, t, n) {
    document.getElementById(t.id + "-day-" + e).onclick = function() {
        0 < document.getElementById(t.id + "-day-num-" + e).innerHTML.length && (t.changeDateTo(document.getElementById(t.id + "-day-num-" + e).innerHTML, e), n())
    }
}, Calendar.prototype.setOnClickListener = function(e, t, n) {
    var i = this.id;
    t = t || function() {}, n = n || function() {};
    var a = this;
    switch (e) {
        case "days-blocks":
            for (var d = 1; d <= 42; d++) a.setupBlock(d, a, t);
            break;
        case "month-slider":
            document.getElementById(i + "-month-back").onclick = function() {
                a.back("month"), t()
            }, document.getElementById(i + "-month-next").onclick = function() {
                a.next("month"), n()
            };
            break;
        case "year-slider":
            document.getElementById(i + "-year-back").onclick = function() {
                a.back("year"), t()
            }, document.getElementById(i + "-year-next").onclick = function() {
                a.next("year"), n()
            }
    }
}, Organizer.prototype = {
    constructor: Organizer,
    back: function(e) {
        var t, n = this.calendar.date,
            i = new Date(11 < n.getMonth() + 1 ? n.getFullYear() + 1 : n.getFullYear(), 12 < n.getMonth() + 1 ? 0 : n.getMonth() + 1, 0).getDate();
        new Date(n.getMonth() < 0 ? n.getFullYear() - 1 : n.getFullYear(), n.getMonth() < 0 ? 11 : n.getMonth(), 0).getDate();
        "day" == e ? (1 != n.getDate() ? (this.changeDateTo(n.getDate() - 1), this.update()) : (this.calendar.back("month"), this.changeDateTo(i), (t = this).onMonthChange(function() {
            t.indicateEvents()
        })), document.getElementById(this.calendar.id + "-day-radio-" + (this.calendar.initday + n.getDate())).checked = !0) : (this.calendar.back(e), (t = this).onMonthChange(function() {
            t.indicateEvents()
        }))
    },
    next: function(e) {
        var t, n = this.calendar.date,
            i = new Date(11 < n.getMonth() + 1 ? n.getFullYear() + 1 : n.getFullYear(), 12 < n.getMonth() + 1 ? 0 : n.getMonth() + 1, 0).getDate();
        new Date(11 < n.getMonth() + 2 ? n.getFullYear() + 1 : n.getFullYear(), 12 < n.getMonth() + 2 ? 0 : n.getMonth() + 2, 0).getDate();
        "day" == e ? (n.getDate() != i ? (n.setDate(n.getDate() + 1), this.update()) : (this.calendar.next("month"), n.setDate(1), (t = this).onMonthChange(function() {
            t.indicateEvents()
        })), document.getElementById(this.calendar.id + "-day-radio-" + (this.calendar.initday + n.getDate())).checked = !0) : (this.calendar.next(e), (t = this).onMonthChange(function() {
            t.indicateEvents()
        }))
    },
    changeDateTo: function(e, t) {
        this.clearHistory();
        var n = this.calendar.changeDateTo(e, t),
            i = this;
        setTimeout(function() {
            n ? i.onMonthChange(function() {
                i.indicateEvents()
            }) : i.update()
        }, 1)
    },
    addDate: function(e, t) {
        this.showHistory();
        var n = this.calendar.changeDateTo(e, t),
            i = this;
        setTimeout(function() {
            n ? i.onMonthChange(function() {
                i.indicateEvents()
            }) : i.update()
        }, 1)
    }
}, Organizer.prototype.draw = function() {
    var e = '<svg style="width: 24px; height: 24px;" viewBox="0 0 24 24"><path fill="' + this.calendar.colors[3] + '" d="M15.41,16.58L10.83,12L15.41,7.41L14,6L8,12L14,18L15.41,16.58Z"></path></svg>',
        t = '<svg style="width: 24px; height: 24px;" viewBox="0 0 24 24"><path fill="' + this.calendar.colors[3] + '" d="M8.59,16.58L13.17,12L8.59,7.41L10,6L16,12L10,18L8.59,16.58Z"></path></svg>',
        n = document.createElement("DIV");
    n.className = "cjslib-events cjslib-size-" + this.calendar.size;
    var i = document.createElement("DIV");
    i.className = "cjslib-date", i.style.backgroundColor = this.calendar.colors[1], i.style.color = this.calendar.colors[3];
    var a = document.createElement("DIV");
    a.id = this.id + "-day-back", a.insertAdjacentHTML("beforeend", e), i.appendChild(a.cloneNode(!0));
    e = document.createElement("SPAN");
    e.id = this.id + "-date", i.appendChild(e.cloneNode(!0));
    a = document.createElement("DIV");
    a.id = this.id + "-day-next", a.insertAdjacentHTML("beforeend", t), i.appendChild(a.cloneNode(!0));
    e = document.createElement("DIV");
    e.className = "cjslib-rows", e.id = this.id + "-list-container";
    t = document.createElement("OL");
    t.className = "cjslib-list", t.id = this.id + "-list";
    a = document.createElement("OL");
    a.className = "cjslib-list", a.id = this.id + "-history", e.appendChild(t.cloneNode(!0)), e.appendChild(a.cloneNode(!0)), n.appendChild(i.cloneNode(!0)), n.appendChild(e.cloneNode(!0)), document.getElementById(this.id).appendChild(n.cloneNode(!0))
}, Organizer.prototype.update = function() {
    document.getElementById(this.id + "-date").innerHTML = this.calendar.months[this.calendar.date.getMonth()] + " " + this.calendar.date.getDate() + ", " + this.calendar.date.getFullYear(), document.getElementById(this.id + "-list").innerHTML = "", this.showEvents()
}, Organizer.prototype.updateData = function(e) {
    this.data = e, this.indicateEvents(), this.update()
}, Organizer.prototype.list = function(e) {
    for (var t = document.createElement("UL"), n = 0; n < e.length; n++) {
        var i = document.createElement("LI");
        i.id = this.id + "-list-item-" + n;
        var a = document.createElement("DIV"),
            d = document.createElement("SPAN");
        d.id = this.id + "-list-item-" + n + "-time", d.class = this.id + " time", d.appendChild(document.createTextNode(e[n].startTime + " - " + e[n].endTime)), a.appendChild(d);
        var o = document.createElement("P");
        o.id = this.id + "-list-item-" + n + "-text";
        var l = document.createTextNode(e[n].text);
        if (null == e[n].link || "" == e[n].link) {
          o.appendChild(l);
        } else {
          (
            (d = document.createElement("A")).href =
              e[n].link, d.class = this.id + " link", d.appendChild(l), o.appendChild(d)
          ), i.appendChild(a), i.appendChild(o), t.appendChild(i)
        }
    }
    return t.innerHTML
}, Organizer.prototype.remember = function(e, t) {
    if (t.startsWith('<div class="cjslib-list-placeholder">')) return "";
    var n = this.calendar.getDateString();
    this.calendar.history.unshift(n);
    var i = document.createElement("UL");
    i.className = "cjslib-list cjslib-list-history";
    var a = document.createElement("LI");
    return a.appendChild(document.createTextNode(n)), a.className = "cjslib-list-history-title cjslib-date", a.style.backgroundColor = this.calendar.colors[1], a.style.color = this.calendar.colors[3], i.appendChild(a), i.innerHTML += t, i.outerHTML
}, Organizer.prototype.clearHistory = function() {
    this.calendar.history = [], document.getElementById(this.id + "-history").innerHTML = ""
}, Organizer.prototype.setupBlock = function(t, n, i) {
    var a = n.calendar;
    document.getElementById(a.id + "-day-" + t).onclick = function() {
        var e;
        0 < document.getElementById(a.id + "-day-num-" + t).innerHTML.length && (document.getElementById(a.id + "-day-radio-" + t).checked || (e = "" + document.getElementById(a.id + "-day-num-" + t).dataset.longpressed, document.getElementById(a.id + "-day-num-" + t).dataset.longpressed = !1, "true" != e && (n.changeDateTo(document.getElementById(a.id + "-day-num-" + t).innerHTML, t), i())))
    }
}, Organizer.prototype.showEvents = function(e) {
    e = e || this.data;
    var t = this.calendar.date,
        n = "",
        i = "";
    try {
        var a = this.calendar.history.indexOf(this.calendar.getDateString()); - 1 < a && (this.calendar.history.splice(a, 1), document.getElementById(this.id + "-history").children[a].remove()), i += i + document.getElementById(this.id + "-list").innerHTML, n = this.list(e[t.getFullYear()][t.getMonth() + 1][t.getDate()])
    } catch (e) {
        n = this.showPlaceholder()
    }
    document.getElementById(this.id + "-list").innerHTML = n
}, Organizer.prototype.showHistory = function(e) {
    e = e || this.data;
    var t = this.calendar.date,
        e = this.remember(t, document.getElementById(this.id + "-list").innerHTML),
        t = document.getElementById(this.id + "-history").innerHTML;
    document.getElementById(this.id + "-history").innerHTML = e + t
}, Organizer.prototype.showPlaceholder = function(e) {
    var t = document.createElement("DIV");
    return t.className = "cjslib-list-placeholder", t.innerHTML = this.calendar.placeholder, t.outerHTML
}, Organizer.prototype.indicateEvents = function(e) {
    e = e || this.data;
    var t = this.calendar.date;
    if (this.calendar.indicator) {
        for (var n = document.getElementsByClassName(this.calendar.id + " cjslib-day cjslib-day-listed"), i = 0; i < n.length; i++) n[i].children[1].innerHTML = "";
        try {
            var a, d = e[t.getFullYear()][t.getMonth() + 1];
            for (a in d) 0 < d[a].length && (n[a - 1].children[1].innerHTML = 9 < d[a].length ? "9+" : d[a].length)
        } catch (e) {}
    }
    this.update()
}, Organizer.prototype.onMonthChange = function(e) {
    e()
}, Organizer.prototype.setOnClickListener = function(e, t, n) {
    var i = this.calendar.id,
        a = this.id;
    t = t || function() {}, n = n || function() {};
    var d = this;
    switch (e) {
        case "days-blocks":
            for (var o = 1; o <= 42; o++) d.setupBlock(o, d, t);
            break;
        case "day-slider":
            document.getElementById(a + "-day-back").onclick = function() {
                d.back("day"), t()
            }, document.getElementById(a + "-day-next").onclick = function() {
                d.next("day"), n()
            };
            break;
        case "month-slider":
            document.getElementById(i + "-month-back").onclick = function() {
                d.back("month"), t()
            }, document.getElementById(i + "-month-next").onclick = function() {
                d.next("month"), n()
            };
            break;
        case "year-slider":
            document.getElementById(i + "-year-back").onclick = function() {
                d.back("year"), t()
            }, document.getElementById(i + "-year-next").onclick = function() {
                d.next("year"), n()
            }
    }
}, Organizer.prototype.setupLongClickBlock = function(e, t, n) {
    function i() {
        document.getElementById(a.id + "-day-num-" + e).dataset.longpressed = "-", window.setTimeout(function() {
            0 < document.getElementById(a.id + "-day-num-" + e).innerHTML.length && "false" != document.getElementById(a.id + "-day-num-" + e).dataset.longpressed && (document.getElementById(a.id + "-day-num-" + e).dataset.longpressed = !0, document.getElementById(a.id + "-day-radio-" + e).checked || (t.addDate(document.getElementById(a.id + "-day-num-" + e).innerHTML, e), n()))
        }, 1e3)
    }
    var a = t.calendar;
    document.getElementById(a.id + "-day-" + e).onmousedown = i, document.getElementById(a.id + "-day-" + e).ontouchstart = i
}, Organizer.prototype.setOnLongClickListener = function(e, t, n) {
    this.calendar.id, this.id;
    t = t || function() {};
    if ("days-blocks" === e)
        for (var i = 1; i <= 42; i++) this.setupLongClickBlock(i, this, t)
};

// initializing a new calendar object, that will use an html container to create itself
var calendar = new Calendar(
  "calendarContainer", // id of html container for calendar
  "medium", // size of calendar, can be small | medium | large
  [
    "Wednesday", // left most day of calendar labels
    3 // maximum length of the calendar labels
  ],
  [
    "#E91E63", // primary color
    "#C2185B", // primary dark color
    "#FFFFFF", // text color
    "#F8BBD0" // text dark color
  ]
);

var data_formatted = JSON.parse(document.getElementById("calendar_data_formatted").dataset.calendar );

var organizer = new Organizer(
  "organizerContainer", // id of html container for calendar
  calendar, // defining the calendar that the organizer is related to
  data_formatted // giving the organizer the static data that should be displayed
);

document.getElementById("year").addEventListener("change", function() {
    window.location.href = `calendars?year=${this.value}`;
});