# https://r4ds.hadley.nz/

library(tidyverse)
library(palmerpenguins)
library(ggthemes)

penguins
glimpse(penguins)

#create a plot that looks at flipper size vs body mass

ggplot(data = penguins)


ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) +
  geom_point() +
  geom_smooth(method = "lm")


# When aesthetic mappings are defined in ggplot(), at the global level, 
# they’re passed down to each of the subsequent geom layers of the plot. 
# However, each geom function in ggplot2 can also take a mapping argument, 
# which allows for aesthetic mappings at the local level that are added to those inherited from the global level. 
# Since we want points to be colored based on species but don’t want the lines to be separated out for them, 
# we should specify color = species for geom_point() only.

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species, shape = species )) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body Mass and Flipper Length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind(
  )


#How many rows are in penguins? How many columns?
#344 rows and 8 columns
  
#What does the bill_depth_mm variable in the penguins data frame describe? Read the help for ?penguins to find out.
#a number denoting bill length (millimeters)

#Make a scatterplot of bill_depth_mm vs. bill_length_mm. 
#That is, make a scatterplot with bill_depth_mm on the y-axis and bill_length_mm on the x-axis. 
#Describe the relationship between these two variables.

ggplot(
  data = penguins,
  mapping = aes(x = bill_length_mm, y = bill_depth_mm)
) + 
  geom_point(mapping = aes(color = species, shape = species )) +
  geom_smooth(method = "lm") 

#there is a negative relationship between depth and length

#What happens if you make a scatterplot of species vs. bill_depth_mm? What might be a better choice of geom?

ggplot(
  data = penguins,
  mapping = aes(x = bill_depth_mm, y = species)
) +
  geom_point()
  
#Why does the following give an error and how would you fix it?
ggplot(data = penguins) + 
  geom_point()

# no definition of the variables for plotting

#What does the na.rm argument do in geom_point()? What is the default value of the argument? 
#Create a scatterplot where you successfully use this argument set to TRUE.

#default is false and it removes NA values
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species, shape = species ), na.rm = TRUE) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body Mass and Flipper Length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind(
  )

#Add the following caption to the plot you made in the previous exercise: “Data come from the palmerpenguins package.” 
#Hint: Take a look at the documentation for labs().

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species, shape = species ), na.rm = TRUE) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body Mass and Flipper Length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    caption = "Data come from the plamerpenguins package",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind(
  )

# Recreate the following visualization. 
# What aesthetic should bill_depth_mm be mapped to? 
# And should it be mapped at the global level or at the geom level?

ggplot(
  data = penguins, 
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = bill_depth_mm)) + 
  geom_smooth()

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
  geom_point() +
  geom_smooth(se = FALSE)

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
  geom_smooth(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  )


penguins %>% 
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point()



#visualization - categorical variable

ggplot(penguins, aes(x=fct_infreq(species)))+ 
  geom_bar()

#visualization - numerical

ggplot(penguins, aes(x= body_mass_g)) +
  geom_histogram(binwidth = 200)


ggplot(penguins, aes(x=body_mass_g)) +
  geom_histogram(binwidth = 20)

ggplot(penguins, aes( x = body_mass_g))+
  geom_histogram(binwidth = 2000)

ggplot(penguins, aes(x = body_mass_g)) +
  geom_density()


#2.4.3 exercises
ggplot(penguins, aes(y=species)) + 
  geom_bar()

ggplot(penguins, aes(x = species)) +
  geom_bar(color = "red")

ggplot(penguins, aes(x = species)) +
  geom_bar(fill = "red")

#What does the bins argument in geom_histogram() do?
# it sets the width of the intervals in a histogram

ggplot(diamonds, aes(x=carat)) +
  geom_histogram(bin)


#2.5 Visualizing Relationships

ggplot(penguins, aes(x = species, y = body_mass_g)) +
  geom_boxplot()

ggplot(penguins, aes(x=body_mass_g, color = species)) +
  geom_density(linewidth=0.75)


ggplot(penguins, aes(x=body_mass_g, color = species, fill = species)) +
  geom_density(alpha=0.5)

##two categorical variables

ggplot(penguins, aes(x= island, fill = species)) +
  geom_bar()

ggplot(penguins, aes(x=island, fill = species)) +
  geom_bar(position="fill")

## three or more variables
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = island))

#too complicated....facet it

ggplot(penguins, aes( x= flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species)) +
  facet_wrap(~island)


##2.5.5 exercises

?mpg

# Make a scatterplot of hwy vs. displ using the mpg data frame. Next, map a third, numerical variable to color, 
# then size, then both color and size, then shape. 
# How do these aesthetics behave differently for categorical vs. numerical variables?

ggplot(mpg, aes(x=displ, y = model, color = model )) + 
  geom_density(linewidth=0.75)


ggplot(penguins, aes(bill_length_mm, bill_depth_mm, color = species)) +
  geom_point() +
  facet_wrap(~species)


ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm, y = bill_depth_mm, 
    color = species, shape = species
  )
) +
  geom_point() +
  labs(color = "Species")

# two labels because of how the global variable vs local variable is defined

ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill")
ggplot(penguins, aes(x = species, fill = island)) +
  geom_bar(position = "fill")


# ggplot(data = mpg) 
# + geom_point(mapping = aes(x = displ, y = hwy))
# this won't work because of the + sign on the line


library(nycflights13)
library(tidyverse)
flights

flights %>% 
  filter(dest == "IAH") %>% 
  group_by(year, month, day) %>% 
  summarize(
    arr_delay = mean(arr_delay, na.rm = TRUE)
  )

flights %>% 
  filter(dep_delay > 120)

flights %>% 
  filter(month %in% c(1,2))

flights %>% 
  arrange(year, month, day, dep_time)

flights %>% 
  distinct(origin, dest)




