FROM python:2
ADD scan_ports.py /

CMD python scan_ports.py 
