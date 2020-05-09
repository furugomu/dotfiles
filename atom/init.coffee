
for b in atom.keymaps.keyBindings
  b.command = 'unset!' if /^ctrl-k /.test(b.keystrokes)

#for b in atom.keymaps.keyBindings
#  b.selector = b.selector.replace('.editor:not(.mini)', 'atom-text-editor')

atom.config.set('atomic-emacs.useNativeNavigationKeys', true)

#require('./eval')
