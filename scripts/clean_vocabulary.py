def main():
    vocab1 = []
    with open("data/BPE_vocabulary_2000.txt", 'r', encoding="utf-8") as infile:
        for line in infile:
            vocab1.append(line.split()[0])
    with open("data/BPE_vocabulary_2000_clean.txt", 'w', encoding="utf-8") as outfile:
        for word in vocab1:
            word += '\n'
            outfile.write(word)

    vocab2 = []
    with open("data/BPE_vocabulary_5000.txt", 'r', encoding="utf-8") as infile:
        for line in infile:
            vocab2.append(line.split()[0])
    with open("data/BPE_vocabulary_5000_clean.txt", 'w', encoding="utf-8") as outfile:
        for word in vocab2:
            word += '\n'
            outfile.write(word)

if __name__ == '__main__':
    main()