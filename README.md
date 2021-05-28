
## This project is unmantained now due to I have no time to spend on this project
look here for new versions of this project https://github.com/nicholasrobertm/RubyCore

---

# RubyCore

### RubyCore is a easy way to create mods for minecraft using ruby.

---

#### **FAQ**

**What the mods i can create?**

You can access all Java, Minecraft, Forge Api using ruby, so, feel free to create!

**Can I use gems?**

Sure, but the gems need to be all in Ruby, native gems(C language) don’t work because the framework has written in Ruby/Java.

**Can I create gems for others moders?**

Yes, please.

**Can i use other dev mods(BuildCraft, IndustrialCraft, etc)**

I don't know :D, but i believe than yes.

**Can i use java in my mod?**

Yes.

**Why Ruby?**

Ruby is a awesome language is made for humans not for machines, is easy to learn and write code, you can create everything with ruby, desktop and mobile apps, web servers, etc, so why not we can create mods for Minecraft?

---

# Geting started:

Develop a mod using RubyCore is very similar with a normal forge mod.

First, download the last version of [Rubycore](http://adf.ly/1NnzfG), unpack the zip in any folder, run the command 'gradlew setupdecompworkspace'.

Donwload the '[jruby-complete.jar](http://jruby.org/download)' and puts in the 'libs/' folder

Run the command '`gradlew runClient`' for start minecraft


---

If you want to mix java code with your mod you can use eclipe for this, just run the command "gradlew eclipse" and open the project on eclipse.

You code will be in the “src/main/resources/mod” folder (ruby only)

the main file of your mod need to contain the prefix “mod_”, ex: mod_newSword.rb

---
## Create a mod using RubyCore is easy:

```ruby
class TutorialMod #create a class
  def pre_init #like a nomal forge mod
    @block = QuickBlock.new(Material.wood) #QuickBlock is a class to create blocks more easily
    @block.setUnlocalizedName("tutorial_block")# normal
    @block.setCreativeTab(CreativeTabs.tabBlocks)# normal
    GameRegistry.registerBlock(@block, "tutorial_block")
  end
end

add_mod(TutorialMod, "Tutorial Mod", "0.1") # tells to rubycore that your mod exists
```

#### This code will make a simple block, but this can be better:

```ruby
class TutorialMod #create a class
  def pre_init #like a nomal forge mod
    @block = QuickBlock.new(:wood) # You can use a symbol to inform a Material
    @block.setUnlocalizedName("tutorial_block")# normal
    @block.setCreativeTab(:blocks)# You can use symbols to inform tabs too
    GameRegistry.registerBlock(@block, "tutorial_block")
  end
end
```

#### Create Items:

```ruby
@item = QuickItem.new() #create a new item
@item.setUnlocalizedName("tutorial_item")
@item.setCreativeTab(:tools)
GameRegistry.registerItem(@item, "tutorial_item")
```

#### Create tabs:

```ruby
@tutorial_tab = QuickTab("Tutorial", @item)
@block.setCreativeTab(@tutorial_tab)
@item.setCreativeTab(@tutorial_tab)
```
---

## Creating a jar for your mod:
Open the file ```src/main/java/btripoloni/rubycore/main/info.java``` and ```build.gradle```and modify with info of your mods, run the command ```gradlew build```

Your jar will be in the folder ```build/libs```

'jruby-complete.jar' is a dependencie of your mod so the users need to download then too.

---
## Contributing:
>- Fork
>- Create a branch
>- Send a pull request

---
## License
The MIT License (MIT)

Copyright (c) 2015 Bruno Tripoloni

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
