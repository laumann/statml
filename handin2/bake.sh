for f in $(ls src/*.eps); do 
    echo "Converting: $f -> ${f%.*}.pdf"
    epstopdf $f;
done
