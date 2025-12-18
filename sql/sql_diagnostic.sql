-- SQL Diagnostic: Network Traffic Analysis
-- Author: Reshan Dulal

-- Q1: Total bytes transferred per protocol
SELECT
    protocol,
    SUM(bytes_transferred) AS total_bytes
FROM network_logs
GROUP BY protocol;

-- Q2: Top 5 source IPs by total bytes transferred
SELECT
    src_ip,
    SUM(bytes_transferred) AS total_bytes
FROM network_logs
GROUP BY src_ip
ORDER BY total_bytes DESC
LIMIT 5;

-- Q3: Average packet size per protocol (only protocols with >1000 records)
SELECT
    protocol,
    AVG(packet_size) AS avg_packet_size
FROM network_logs
GROUP BY protocol
HAVING COUNT(*) > 1000;
