retries = 0

while true
  begin
    raise StandardError, 'hoge'
  rescue StandardError => e
    raise if retries >= 3
    retries += 1
    # logger.warn(error...)
    sleep(1 * retries)
    puts 'retry'
    retry
  end
end
