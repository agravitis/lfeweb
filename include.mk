vpath %.lfe  ./src/pages
vpath %.lfe  ./lfeweb/examples
vpath %.beam ./ebin


LSRCS=web_blog.lfe web_viewsource.lfe web_vote.lfe \
      web_sort.lfe web_link.lfe web_chat.lfe web_piki.lfe \
      web_counter.lfe web_calc.lfe  $(AND_FILE)
LOBJS=$(LSRCS:.lfe=.beam)

ERL_LOAD='code:load_file(lfe_comp).'
ERL_COMP='File=hd(init:get_plain_arguments()), try lfe_comp:file(File,[report,{outdir,"ebin"}]) of {ok,_Module} -> halt(0); error -> halt(1); All ->  io:format("./~s:1: ~p~n",[File,All]) catch X:Y -> io:format("./~s:1: Catch outside of compiler: ~p ~p ~n",[File,X,Y]) end, halt(1).'

.PHONY: all

all: compile $(LOBJS)

%.beam : %.lfe
	@echo Recompile: $<
	@erl -noshell -eval $(ERL_LOAD) -eval $(ERL_COMP) -extra $< 

lclean: clean
	rm -rf compile.err compile.out *.dump 

wipe: clean lclean
	rm -rf *.beam


FLY_BEAM=$(notdir $(CHK_SOURCES:.lfe=.beam))
BEAM=$(notdir $(CHK_SOURCES:_flymake.lfe=.beam)) 
MODULE=$(notdir $(CHK_SOURCES:_flymake.lfe=)) 

#	prerequisite 1. Only one screen, 2. run "screen","screen -t server1","sh start.sh" 
#	Install mozrepl for page reload, http://wiki.github.com/bard/mozrepl

check-syntax:
	erl -noshell -pa ${HOME}/elib/lfe/ebin -eval $(ERL_LOAD) -eval $(ERL_COMP) -extra $(CHK_SOURCES) 
#	If flymake-mode is not working, comment lines below.
	mv ebin/$(FLY_BEAM) ebin/$(BEAM)  >  compile.out 2> compile.err
	@screen -p server1 -X stuff $''code:purge($(MODULE)),code:load_file($(MODULE)).' \
		 >> compile.out 2>> compile.err
	@echo BrowserReload\(\)\; repl.quit\(\) | nc localhost 4242 >> compile.out 2>> compile.err


help:
	@echo ";; Copy to .emacs, then restart."
	@echo "(when (load \"flymake\" t)"
	@echo "  (setq flymake-log-level 3)"
	@echo "  (add-hook 'find-file-hook 'flymake-find-file-hook)"
	@echo "  (add-to-list 'flymake-allowed-file-name-masks"
	@echo "	       '(\"\\\\\.lfe\\\\\'\" flymake-simple-make-init)))"
	@echo ""
	@echo "(autoload 'moz-minor-mode \"moz\" \"Mozilla Minor and Inferior Mozilla Modes\" t)"
	@echo "(add-hook 'javascript-mode-hook 'javascript-custom-setup)"
	@echo "    (defun javascript-custom-setup ()"
	@echo "      (moz-minor-mode 1))"
	@echo "(global-set-key (kbd \"C-x p\")"
	@echo "                (lambda ()"
	@echo "                  (interactive)"
	@echo "                  (comint-send-string (inferior-moz-process)"
	@echo "                                      \"BrowserReload();\")))"


