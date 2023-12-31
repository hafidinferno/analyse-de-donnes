#Devoir TP2 

#Exercice 24 station du ski 

stations <- read.csv("C:/Users/ProDesK/Downloads/post-197353-stations.txt", sep="")

res.pca1 <- PCA(stations,quali.sup =1, graph = FALSE)

#valeurs propres 

valp<-- get_eigenvalue(res.pca1)

# La r�gle de Kaiser. Elle consiste � retenir les axes pour lesquels les valeurs propres sontsup�rieures � 1 . Il est � noter qu'on peut aussi avoir des r�sultats d'ACP dont la somme des valeurs propres
#n'est pas �gale � p . Dans ce cas, il faut adapter cette r�gle deKaiser et retenir les valeurs propres
#sup�rieures � la moyenne des valeurs propres, et non plus � 1.

#l'interpr�tation. 

fviz_eig(res.pca1, addlabels = TRUE, ylim = c(0, 50))

#interpr�ter les 2 axes.
var <- get_pca_var(res.pca1)
var

# Coordonn�es
head(var$coord)

# Cos2 : qualit� de r�presentation
head(var$cos2)

# Contributions aux composantes principales
head(var$contrib)

fviz_pca_var(res.pca1, col.var = "blue")

library("corrplot")
corrplot(var$cos2, is.corr=FALSE)
fviz_contrib(res.pca1, choice = "ind", axes = 1 :2)

ind <- get_pca_ind(res.pca1)
ind

# Coordonn�es des individus
head(ind$coord)

# Qualit� des individus
head(ind$cos2)

# Contributions des individus
head(ind$contrib)

fviz_pca_ind (res.pca1)
fviz_pca_ind (res.pca1, col.ind = "cos2",
              gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
              repel = TRUE )


