class QuickBlock < Block
	def initalize(material)
		super(material)
		@name = "QuickBlock"
	end

	def getName
		@name
	end

	def name=(name)
		@name = name
	end
end

class QuickItem < Item
	def initialize
		#super(name)
		@name = "QuickItem"
		#@name = name unless name
		#GameRegistry.registerItem(self, @name)
	end

	def getName
		@name
	end

	def name=(name)
		@name = name
	end
end

class QuickTab < CreativeTabs
	def initialize(name, item)
		super(name)
		@item = item
	end

	java_annotation("Override")
	def getTabIconItem()
		@item
	end
end

class QuickWordGenerator
	def initialize
		@Ore = []
	end
	java_implements IWorldGenerator
	java_annotation("Override")
	def generate(r, chunckX, chunckZ, world, chunckGenerator, chunckProvider)
		case world.provider.dimensionId
			when 0 #OverWorld
				generateOverWorld(world, r, chunckX * 16, chunckZ * 16)
			#when 1 #Nether
				#generateNether(world, r, chunckX, chunckZ)
			#when -1 #End
				#generateEnd(world, r, chunckX, chunckZ)
		end
	end

	def generateOverWorld(world, r, chunckX, chunckZ)
		#addOres(@Block, world, r, chunckX, chunckZ, 16, 16, 18, 20, 0, 100)
		@Ore.each {|ore| addOres(ore[:block], world, r, chunckX, chunckZ, ore[:maxY], ore[:maxZ], ore[:vainSize], ore[:spawnChance], ore[:yMin], ore[:yMax])}
	end

	def addOres(block, world, r, chunckX, chunckZ, maxX, maxZ, vainSize, spawnChance, yMin, yMax)
		spawnChance.times do |t|
			posX = chunckX + r.nextInt(15)
			posZ = chunckZ + r.nextInt(15)
			posY = yMin + r.nextInt(yMax - yMin)
			worldGen = WorldGenMinable.new(block, vainSize)
			worldGen.generate(world, r, posX, posY, posZ)
		end
	end

	def add_ore(block, maxY, maxZ, vainSize, spawnChance, yMin, yMax)
		@Ore << {block: block, maxY: maxY, maxZ: maxZ, vainSize: vainSize, spawnChance: spawnChance, yMin: yMin, yMax: yMax}
	end
end
