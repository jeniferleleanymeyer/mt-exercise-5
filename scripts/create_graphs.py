import re
import matplotlib.pyplot as plt
import csv

def main():
    scores = []
    times = []
    beam = []
    # read data
    i = 1
    with open('scripts/part_2/part_2.txt', 'r', encoding="utf-8") as infile:
        for line in infile:
            if '"score":' in line:
                bleu = re.findall('\d+\.\d+', line)
                scores.append(float(bleu[0]))
                beam.append(i)
                i += 1
            if 'Generation took' in line:
                time = re.findall('\d+\.\d+', line)
                times.append(round(float(time[0])/60, 3))
    # create table
    header = ['beam size', 'BLEU score', 'generation time (minutes)']
    with open('scripts/part_2/table.csv', 'w', encoding="utf-8") as outfile:
        writer = csv.writer(outfile)
        writer.writerow(header)
        for i in range(10):
            writer.writerow([beam[i], scores[i], times[i]])
    # create plots
    fig, axs = plt.subplots(2)
    fig.suptitle('beam size impact')
    axs[0].plot(beam, scores, label='BLEU score', color='green')
    axs[0].legend(loc='lower right')
    axs[0].set_ylim(18.0, 25.0)
    axs[1].plot(beam, times, label='generation time (min)', color='red')
    axs[1].legend(loc='lower right')
    axs[1].set_ylim(0, 15.0)
    plt.savefig('scripts/part_2/beam_size_plot.png')

    return

if __name__ == '__main__':
    main()