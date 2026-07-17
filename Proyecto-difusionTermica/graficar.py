import numpy as np
import matplotlib.pyplot as plt

datos = np.loadtxt("p_calor.txt")

plt.figure(figsize=(8, 6))
plt.imshow(datos, cmap="inferno", origin="lower", aspect="equal")
plt.colorbar(label="Temperatura")
plt.title("Mapa de calor")
plt.xlabel("Columna")
plt.ylabel("Fila")
plt.savefig("mapa_calor.png", dpi=300, bbox_inches="tight")