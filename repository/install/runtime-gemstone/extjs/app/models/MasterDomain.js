/*
	Basisklasse der API Klassen. 
*/
Ext.define( 'stsclient.model.MasterDomain', {
    alias: 'model.masterdomain',
	extend: 'Ext.data.Model',

	statics: {
		// Diese Funktion wird immer bei Attributen vom Type DateAndTime genutzt
		DateSerializer: function(v) {return Ext.isDate(v) ? Ext.Date.format(v, Cati.common.model.Enums.DateTimeFormats.DATETIME) : null; },
		DateConvert: function(v) { return  (v) ?  Ext.Date.parse(v, Cati.common.model.Enums.DateTimeFormats.DATETIME) : null;  },

		DateOnlySerializer: function(v) { return Ext.isDate(v) ? Ext.Date.format(v, Cati.common.model.Enums.DateTimeFormats.DATE) : null; },
		DateOnlyConvert: function(v) { return  (v) ?  Ext.Date.parse(v, Cati.common.model.Enums.DateTimeFormats.DATE) : null;   },

		DateAndTimeNow: function() { return new Date() ;   }
	},


	constructor : function (data, id, raw, convertedData, parseAssociation) {
		this.callParent([data, id, raw, convertedData]);
		if (parseAssociation) {
			this.getProxy().getReader().readAssociated(this, data);
		}
	}

});
