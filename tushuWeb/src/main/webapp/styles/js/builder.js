/*
 class Builder 
 author  : 零度 
 email   : hfeng1985@yahoo.cn 
 version : 0.1
*/
if(!window.Builder){
  var Builder = function(options){
          this.options = {
          };
          if(options){
              this.options = $.extend(true, this.options, options);
          };
          this.init();
  };
  Builder.prototype = {
         init:function(){
             this.cacheTmpl = {};
         },
         build:function(data, tpl_opt){
             var tmpl = this.loadTmpl(tpl_opt);
             var html = $.tmpl(tmpl.name, data, tmpl.opt);
             return html;
         },
         loadTmpl:function(tpl_opt){
             var tmpl;
             var tpl_name = tpl_opt.name;
             var tpl = this.cacheTmpl[tpl_name];
             if(!tpl){
                 tmpl = $.ajax({
                      url :tpl_opt.url,
                      cache   :false,
                      async   :false
                 }).responseText;
                 tmpl = $.template(tpl_opt.name, tmpl);
                 this.cacheTmpl[tpl_name] = {name: tpl_name, tpl: tmpl, opt: tpl_opt.opt};
                 tpl = this.cacheTmpl[tpl_name];
             };
             return tpl;
         }
  };
};
