def main():
		fin = open("input","r")
		fout = open("output","w")
		lista = fin.readlines()
		for i in range(0,len(lista)):
				y = int(lista[i])
				x = int(lista[i])
				dx = int(lista[i])
				u = int(lista[i])
				f1 = x + dx
				f2 = u - (3*x*u*dx) - (3*y*dx)
				f3 = y + u*dx
				fout.write(str(f1)+'\n')
				fout.write(str(f2)+'\n')
				fout.write(str(f3)+'\n\n')

		fout.close()
		fin.close()

if __name__ == "__main__":
	main()
